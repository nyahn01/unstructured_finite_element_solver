# Unstructured Finite Element Solver

[![Python 3.x](https://img.shields.io/badge/python-3.x-blue.svg)](https://www.python.org/downloads/)
[![FEniCS](https://img.shields.io/badge/FEniCS-compatible-green.svg)](https://fenicsproject.org/)

A finite element implementation for solving heat diffusion problems using FEniCS. This project demonstrates the implementation of unsteady heat equations on complex geometries with various boundary conditions.

## Project Description

This repository contains Python implementations of finite element methods for heat diffusion problems, progressing from simple validation cases to complex 3D applications. The solver supports unstructured meshes, mixed boundary conditions, and includes parallel computing capabilities.

**Implemented Features:**
- Heat diffusion equation solver using FEniCS
- Support for Dirichlet and Neumann boundary conditions
- 2D and 3D problem capabilities
- MPI parallelization for large problems
- Parameter estimation using algorithmic differentiation
- Validation against analytical solutions

## Mathematical Foundation

**Governing Equation:**
```
∂T/∂t - α∇²T = 0    in Ω
```

**Boundary Conditions:**
- Dirichlet: T = T_D (prescribed temperature)
- Neumann: -k∇T·n = q (prescribed heat flux)

**Discretization:**
- Spatial: Galerkin finite element method with linear elements
- Temporal: Backward Euler scheme
- Weak form implementation using FEniCS variational forms

## Repository Structure

```
code/
├── case1-2d-square/           # 2D square validation case
│   └── 2d-square.py          # Implementation with analytical solution
├── case2-cylinder/            # Concentric cylinders case
│   └── cylinder.py           # Radially symmetric heat conduction
├── case3-rod/                 # 1D rod with Neumann boundary
│   └── rod.py                # Heat flux boundary condition test
├── case4-piston/              # Piston thermal analysis
│   ├── piston-2d/           # 2D piston implementation
│   │   └── piston-2d.py
│   └── piston-3d/           # 3D piston with parallelization
│       └── piston-3d.py
├── case5-algorithmic-diff/    # Parameter estimation
└── test-fenics.py            # Installation verification script
```

## Installation

### Prerequisites
- Python 3.x
- FEniCS (2019.1.0 or compatible)
- NumPy
- Matplotlib (for visualization)

### Method: Docker (Recommended)
```bash
# Get FEniCS Docker environment
curl -s https://get.fenicsproject.org | bash

# Clone repository
git clone <repository-url>
cd unstructured_finite_element_solver

# Run in container
fenicsproject run
python3 code/test-fenics.py
```
## Usage Examples

### Case 1: Basic Validation
```bash
cd code/case1-2d-square/
python 2d-square.py
```
**Expected output:** Convergence to analytical solution with machine precision accuracy

### Case 4: Piston Analysis
```bash
cd code/case4-piston/piston-2d/
python piston-2d.py
```
**Output:** Temperature distribution in piston geometry

### Parallel Execution
```bash
cd code/case4-piston/piston-3d/
mpirun -n 4 python piston-3d.py
```

### Parameter Estimation
```bash
cd code/case5-algorithmic-diff/
python square-parameter-estimation.py
```

## Test Cases

### Case 1: 2D Square Domain
- **Purpose:** Validate solver with analytical solution
- **Problem:** u = 1 + x² + αy² + βt
- **Mesh:** 8×8 uniform grid
- **Result:** Exact solution recovery

### Case 2: Concentric Cylinders  
- **Purpose:** Test radially symmetric problems
- **Geometry:** Inner radius 0.2, outer radius 1.0
- **Boundary:** Fixed temperatures (inner: 5°C, outer: 1°C)
- **Validation:** Logarithmic analytical solution

### Case 3: 2D Rod
- **Purpose:** Validate Neumann boundary conditions
- **Setup:** Heat flux on left boundary, insulated elsewhere
- **Solution:** Time-dependent analytical formula available

### Case 4: Piston Thermal Analysis
- **Purpose:** Complex geometry application
- **Variants:** 
  - Subcase 1: Fixed temperature boundary (300°C top)
  - Subcase 2: Constant heat flux (2 MW/m²)
  - Subcase 3: Time-varying flux (engine cycle simulation)
- **Material:** Aluminum alloy properties
- **Validation:** 2D vs 3D comparison

### Case 5: Parameter Estimation
- **Purpose:** Demonstrate algorithmic differentiation
- **Method:** Inverse problem using dolfin-adjoint
- **Target:** Recover thermal diffusivity from temperature data
- **Applications:** Both square and piston geometries

## Results Summary

**Validation Accuracy:**
- All cases converge to analytical solutions where available
- Mesh convergence studies confirm expected order of accuracy
- 2D and 3D piston results show consistent temperature patterns

**Parallel Performance (3D Piston, 166,681 elements):**
- 1 processor: 285 seconds
- 2 processors: 192 seconds (1.48× speedup, 74% efficiency)
- 4 processors: 138 seconds (2.06× speedup, 51% efficiency)

**Parameter Estimation:**
- Successfully recovers diffusion coefficients
- Convergence depends on initial guess and step size selection
- Demonstrates both forward and adjoint solver capabilities

## Dependencies and Tools

**Core Dependencies:**
```
fenics>=2019.1.0
numpy
matplotlib
```

**Optional Tools:**
- **GMSH:** Mesh generation
- **ParaView:** Result visualization (.pvd files)
- **MPI:** Parallel execution
- **dolfin-adjoint:** Algorithmic differentiation

**File Formats:**
- Input: .xml (mesh), .py (solver)
- Output: .pvd (ParaView), .h5 (HDF5 data)

## Mesh Requirements

**Supported Formats:**
- FEniCS XML format
- Convert from GMSH: `dolfin-convert mesh.msh mesh.xml`

**Mesh Generation:**
```bash
# Example GMSH workflow
gmsh -2 geometry.geo -o geometry.msh
dolfin-convert geometry.msh geometry.xml
```

## Visualization

**ParaView Visualization:**
```bash
# Open solution files
paraview solution.pvd
```

**Matplotlib Plots:**
- Automatically generated during solution process
- Temperature distributions and convergence plots
- Error analysis and mesh studies

## Troubleshooting

**Installation Issues:**
```bash
# Test FEniCS
python code/test-fenics.py
# Should print: "Fenics available"
```

**Common Problems:**
- **Mesh import errors:** Ensure proper conversion from GMSH
- **MPI issues:** Verify mpi4py installation
- **Memory problems:** Use smaller mesh sizes for large 3D cases

## Technical Notes

**Time Integration:**
- Backward Euler scheme for unconditional stability
- Time step size affects accuracy and stability
- Convergence studies included in validation cases

**Boundary Condition Implementation:**
- DirichletBC for prescribed temperatures
- Neumann conditions via weak form integrals
- Mixed boundary types supported

**Parallel Implementation:**
- Domain decomposition using METIS
- MPI communication via PETSc
- Optimal performance typically with 2-4 processors

## Academic Context

The implementation focuses on:

- Systematic validation methodology
- Progressive complexity in test cases
- Performance analysis and optimization
- Integration of advanced features (AD, MPI)

## License

MIT License - see LICENSE file for details.

## Contact

For questions about this implementation, please open an issue in the repository.
