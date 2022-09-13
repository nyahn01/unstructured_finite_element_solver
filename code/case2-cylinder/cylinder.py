"""
Heat equation with Dirichlet conditions.
Test problem is chosen to give an exact solution at all nodes of the mesh.

  u'= kappa * Laplace(u) + f  in the unit square
  u = T_i             on the inner boundary
  u = T_a             on the outer boundary

  f = 0

Objective: Implement unsteady heat equation and import a mesh generated with GMSH.
"""

