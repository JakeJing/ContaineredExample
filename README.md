## Template for Julia Project



### 1. Structure of the repository

This is a minimal template for building your own julia project (depends on `DrWatson`). The reposotory is organized in the following way:

1.  **src** is used for saving your own functions;
2. **Main** is for project-related script, such as data preprocessing, modeling and visualisation.

### 2. Pack the repository into a singularity container

You can expand the repository to include other elements, such as **Data** and **Results**. It is also recommended to install the `Singularity` [package](https://github.com/Crown421/Singularity.jl) in julia, which allows you to easily pack your project and dependency packages in a singularity container. For example:

```julia
>> julia --proj
(ContaineredExample) pkg > add Distances # 1st way of adding dependency pkg
julia > generate_deffile()
julia > buildsif()
```

To test and expand the singularity container, you can initiate the shell via the container. 

```julia
>> sudo singularity shell container/projectcontainer.sif
singularity >> julia --proj
julia > using Distances
julia > add Plots # 2nd way of adding dependency package
```

In order to pack the revised repository again, you need to get out of the singularity shell, and go back to the main console of julia, since *sudo* access is needed.

```
julia > exit()
singularity >> exit
>> pwd() # /home/ubuntu/ContaineredExample
>> julia --proj
julia > generate_deffile()
julia > buildsif()
```

### 3. Send the repository and singularity container to the cluster

It seems that the packages are packed in two different folders (**1. containerhome**; **2. inside the protectcontainer.sif**). If you send the whole repository to the cluster, you may first need create a sandbox from the **protectcontainer.sif**.

```bash
singularity build --sandbox protectcontainer protectcontainer.sif
```

You need to specify the path in your bash script, so that julia can find the right package directory.

```bash
export JULIA_PKGDIR="sandbox/containerhome/.julia"
export JULIA_PKGDIR="sandbox/protectcontainer/user/.julia"
```



Related links:

1. [video tutorial](https://www.youtube.com/watch?v=3Igtnx-z344) in juliaconf 2020 by Steffen Ridderbusch.

**Todo:**

1. incorporate this with `PkgTemplates` to specify user-defined name for the project;
2. write a wrapper function in the shell to automatically download the template and create a new repository with pre-defined name;
3. it would be more convenient to collapse all the necessary packages in the same folder.