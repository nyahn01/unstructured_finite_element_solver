# Finite Element Heat Diffusion Solver

[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![FEniCS](https://img.shields.io/badge/FEniCS-2019.1.0-green.svg)](https://fenicsproject.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A finite element implementation for solving heat diffusion problems using FEniCS.

## Overview

This repository contains Python implementations of finite element methods for 2D and 3D heat diffusion problems. The project demonstrates progressive complexity through validation cases with analytical solutions, culminating in realistic piston thermal analysis with parallel computing and parameter estimation capabilities.

**Key Learning Outcomes:**
- Implementation of finite element methods using FEniCS
- Validation against analytical solutions
- Mesh convergence studies and error analysis
- Parallel computing with MPI domain decomposition
- Algorithmic differentiation for parameter estimation

## Mathematical Formulation

The solver implements the unsteady heat diffusion equation:

```
∂T/∂t - α∇²T = 0    in Ω × (0,T]
```

**Boundary Conditions:**
- Dirichlet: `T = T_D` (prescribed temperature)
- Neumann: `-k∇T·n = q` (prescribed heat flux)

**Numerical Method:**
- Spatial discretization: Galerkin finite element method
- Temporal discretization: Backward Euler scheme
- Linear solvers: PETSc direct/iterative methods

## Repository Structure

```
code/
├── case1-2d-square/           # Validation: 2D square with analytical solution
├── case2-cylinder/            # Validation: concentric cylinders  
├── case3-rod/                 # Validation: 1D rod with Neumann BC
├── case4-piston/              # Application: 2D/3D piston thermal analysis
│   ├── piston-2d/            # 2D piston implementation
│   └── piston-3d/            # 3D piston with MPI parallelization
├── case5-algorithmic-diff/    # Parameter estimation using dolfin-adjoint
└── test-fenics.py            # Installation verification
```

## Installation

### Docker (Recommended)
```bash
# Install FEniCS via Docker
curl -s https://get.fenicsproject.org | bash

# Clone repository
git clone https://github.com/yourusername/unstructured_finite_element_solver.git
cd unstructured_finite_element_solver

# Run in FEniCS container
fenicsproject run
python3 code/test-fenics.py
```

### Conda Installation
```bash
conda create -n fenics-env -c conda-forge fenics matplotlib numpy
conda activate fenics-env
python code/test-fenics.py  # Should print "Fenics available"
```

## Validation Cases

### Case 1: 2D Square Domain
**Purpose:** Verify solver implementation with known analytical solution

```bash
cd code/case1-2d-square/
python 2d-square.py
```

**Test problem:** `u = 1 + x² + αy² + βt` with `f = β - 2 - 2α`
- **Mesh:** 8×8 uniform elements (81 nodes)
- **Time steps:** 20 steps over 2 seconds
- **Expected result:** Machine precision accuracy

### Case 2: Concentric Cylinders
**Purpose:** Validate with radially symmetric analytical solution

**Setup:** Inner cylinder (r=0.2) at 5°C, outer cylinder (r=1.0) at 1°C
- **Mesh:** 3,572 triangular elements
- **Analytical solution:** `T(r) = T_i - (ln r - ln r_i)(T_i - T_o)/(ln r_o - ln r_i)`

### Case 3: 2D Rod with Heat Flux
**Purpose:** Test Neumann boundary condition implementation

**Setup:** Constant heat flux on left boundary, insulated elsewhere
- **Mesh:** 5,220 elements
- **Analytical solution:** Available in literature

### Case 4: Piston Thermal Analysis
**Purpose:** Realistic engineering application

**Three subcases:**
1. **Dirichlet BC:** Fixed temperature (300°C) on top surface
2. **Neumann BC:** Constant heat flux (2 MW/m²) on top surface  
3. **Time-varying BC:** Engine cycle heat flux profile

**Material:** Aluminum alloy (α = 5.4×10⁻⁵ m²/s)

**Results:**
- 2D and 3D solutions show similar temperature distributions
- Validates potential for 2D approximation of 3D problems
- Demonstrates solver capability on complex geometries

## Parallel Performance

**Test Case:** 3D Piston (166,681 elements)

| Processors | Runtime (sec) | Speedup | Efficiency |
|------------|---------------|---------|------------|
| 1          | 285          | 1.00    | 100%       |
| 2          | 192          | 1.48    | 74%        |
| 4          | 138          | 2.06    | 51%        |
| 8          | 121          | 2.35    | 29%        |

**Key Findings:**
- Optimal performance with 2-4 processors for this problem size
- Communication overhead becomes significant beyond 4 processors
- Domain decomposition works well for structured problems

## Parameter Estimation

**Case 5** demonstrates algorithmic differentiation using dolfin-adjoint:

```python
# Estimate thermal diffusivity from temperature measurements
from fenics_adjoint import *

nu = Constant(5.0)  # Initial guess
control = Control(nu)

# Minimize objective function
J = assemble(inner(u_reference - u_computed, u_reference - u_computed)*dx)
dJdnu = compute_gradient(J, control)
nu_updated = nu - alpha * dJdnu
```

**Results:**
- Successfully recovers thermal diffusivity parameters
- Convergence depends on initial guess and step size selection
- Validates both forward and adjoint implementations

## Usage Examples

### Running a Basic Case
```bash
cd code/case1-2d-square/
python 2d-square.py
# Outputs: solution.pvd (viewable in ParaView)
```

### Parallel Execution
```bash
cd code/case4-piston/piston-3d/
mpirun -n 4 python piston-3d.py
```

### Mesh Generation
```bash
# Generate mesh with GMSH (if available)
gmsh -2 geometry.geo -o geometry.msh
dolfin-convert geometry.msh geometry.xml
```

## Dependencies

**Core Requirements:**
- FEniCS 2019.1.0+
- NumPy
- Matplotlib
- mpi4py (for parallel execution)

**Optional:**
- GMSH (mesh generation)
- ParaView (visualization)
- dolfin-adjoint (parameter estimation)

## Known Limitations

- **Geometry complexity:** Limited to simple CAD geometries
- **Material models:** Only linear, isotropic materials
- **Boundary conditions:** Basic Dirichlet/Neumann types
- **Time integration:** First-order backward Euler only
- **Error estimation:** No adaptive mesh refinement

## Troubleshooting

**FEniCS installation issues:**
```bash
# Test FEniCS installation
python code/test-fenics.py
# Should output: "Fenics available"
```

**Mesh conversion problems:**
```bash
# Convert GMSH mesh to FEniCS format
dolfin-convert input.msh output.xml
```

**Parallel execution errors:**
```bash
# Verify MPI installation
mpirun --version
mpirun -n 2 python -c "from mpi4py import MPI; print('Rank:', MPI.COMM_WORLD.Get_rank())"
```

## Contributing

This is an academic project, but improvements and extensions are welcome:
- Bug reports and fixes
- Additional validation cases
- Performance improvements
- Documentation enhancements

Please open an issue before making significant changes.

## License

MIT License - see [LICENSE](LICENSE) file for details.
