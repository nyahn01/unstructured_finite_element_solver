"""
Heat equation with Neumann conditions.
Test problem is chosen to give an exact solution at all nodes of the mesh.

  u'= kappa * Laplace(u) + f  in the unit square
  du/dn = g             on the left boundary
  du/dn = 0             on the other boundaries

  f = 0

Objective: implement a Neumann boundary condition and validate solution.
"""

