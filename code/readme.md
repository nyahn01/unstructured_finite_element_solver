# Pull your repo
run the command:
```
git pull git@git.rwth-aachen.de:cd_group5_unstructuredfem/sisclab_unstr_fem.git
```

# Installing Fenics
## Using docker

1. Install docker (https://docs.docker.com/install/):
```
sudo apt-get docker
```
2. Run docker:
```
sudo systemctl start docker
```
3. Get Fenics script:
```
curl -s https://get.fenicsproject.org | bash
```
3. Launch fenics image:
```
fenicsproject run
```
4. Test the image:
```
python3 ./test.py
```
the program must return
```
Fenics available
```
if not, something went wrong.

## Using conda

1. Get and install miniconda 3 here: https://conda.io/miniconda.html

2. Get the fenics project from conda forge:
```
conda create -n fenicsproject -c conda-forge fenics
source activate fenicsproject
```

3. Test the image:
```
python ./test.py
```

# Pre- and post-processing
- To generate meshes install GMSH (http://gmsh.info/):
```
sudo apt-get install gmsh
```
- To visualize and post-process the data install Paraview (https://www.paraview.org/):
```
sudo apt-get install paraview
```
# Tutorial for fenics from fenics:
https://fenicsproject.org/pub/tutorial/html/ftut1.html

# Validation

Your first task is to complete the case2 and case3 using the documents in the Validation folder.

# Convert GMSH to Fenics mesh format
Enter the following command:
```
dolfin-convert geometry.msh geometry.xml
```
