# SMART: Speedy Measurement of Arabidopsis Rosette Traits

Speedy Measurement of Arabidopsis Rossette Traits for time-course monitoring morphological and physiological traits

Plant phenotyping using computer vision and machine learning

Compute both morphological and physiological traits with unique plant surface color analysis ability

Author: Suxing Liu

Note: This is a release version for paper publication purpose only, there are other repositories which contains updated development and bug fix.

##



![Optional Text](../main/media/logo.png) 

Robust and parameter-free plant image segmentation and trait extraction.

1. Input: Image data of plant image top views in the same folder (jpg or png format). 

2. Output: Image results and excel file contains all traits computation in pixel units.

3. Pre-trained ML model was applied to aid the plant object segmeneation from background process along with the color clustering based segmenation method. 

3. Unsupervised dominant color clustering method was applied to compute the color distribution of the plant surface area.


## Sample workflow

![Pipeline](../main/media/pipeline.png)

![Color analysis](../main/media/color_analysis.png)

![Monitor plant growth](../main/media/monitor_time_growth.gif)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Contents**

<!-- END doctoc generated TOC please keep comment here to allow auto-update -->




## Inputs 

   Individual plant tray image from top view, captured by ANY modern digital camera. 

## Results 

trait.xlsx, trait.csv

Excel or csv file which contains trait computation values.

## Traits summary

![Pipeline](../main/media/trait_table.png)


## Usage in the local environment by cloning the whole GitHub repo 

sample test

Input: Plant top view images, in jpg or png format

Output: Image results and trait.xlsx (a summary of trait computation values in pixel units). 





Example input can be downloaded from the "/sample_test/" folder, which contains top-view images of the same Arabidopsis plant from different time points. 


1. Download the repo into the local host PC to the $host_path:

```bash

    git clone https://github.com/Computational-Plant-Science/ml_smart_release.git

```

   Now you should have a clone of the SMART pipeline source code in your local PC, the relative folder path was:
```
   $host_path/ml_smart_release/
   
```

2. Prepare your input image folder path and output path

   here we use the sample images inside the repository as input image data, the path was:
```
   /$host_path/ml_smart_release/sample_test/
   
```

2. compute traits:

   please define the input path which coantains image data (png or jpg formats) and create an output folder path to save all the image results and an excel file result:

```bash

   mkdir /$host_path/ml_smart_release/result/

   python3 /$host_path/ml_smart_release/smart_release.py -i /$host_path/SMART/ml_smart_release/sample_test/ -o /$host_path/SMART/ml_smart_release/sample_test/result/`

```
   If no output folder path was specified, default output path will be the same as input path. 






## Usage for Docker container (Suggested)


[Docker](https://www.docker.com/) is suggested to run this project in a Unix environment.

1. Download prebuilt docker container from DockerHub 

```bash

    docker pull computationalplantscience/smart
```

2. Build your local container

```bash

    docker build -t smart_container -f Dockerfile .

```

3. Run the docker container with your test images


   Run the prebuilt docker container from DockerHub 
```bash

    docker run -v /$path_to_test_image:/images -it computationalplantscience/ml_smart_release
    
```
    or Run the docker container build locally
    
```bash

    docker run -v  /home/suxing/SMART/sample_test:/images -it smart_container

Note: The "/" at the end of the path was NOT needed when mounting a host directory into a Docker container. Above command mount the local directory "/$path_to_test_image" inside the container path "/images"
Reference: https://docs.docker.com/storage/bind-mounts/
```

    For example, to run the sample test inside this repo, under the folder "sample_test", first locate the local path 
```
    docker run -v /$path_to_ml_smart_release_repo/ml_smart_release/sample_test:/images -it computationalplantscience/ml_smart_release
```

    then run the pipeline inside the container with mounted input images:
``` 
    python3 /opt/code/smart_release.py -p /images/ -o /images/result/ -ai 1
    
```
    or 
```
    /$path_to_ml_smart_release_repo/ml_smart_release/sample_test:/images -it computationalplantscience/ml_smart_release  python3 /opt/code/smart_release.py -p /images/ -o /images/results/ -ai 1

```



Results will be generated in the same input folder, trait.xlsx and trait.csv, which contains trait computation results.

The other folder with the same name of input images contains all related image results for visualization purposes. 

They are processed copies of the original images, all the image content information was processed and extracted as traits information. 


## Collaboration


The SMART pipeline has been integrated into CyVerse cloud computing-based website: PlantIT (https://plantit.cyverse.org/)

CyVerse users can upload data and run the SMART pipeline for free. 


The SMART pipeline has also been applied in collaboration with following research institutes and companies: 

1. Dr. David G. Mendoza-Cozatl at [University of Missouri](https://cafnr.missouri.edu/person/david-mendoza-cozatl/)

2. Dr. Kranthi Varala at [Purdue University](https://www.purdue.edu/gradschool/pulse/groups/profiles/faculty/varala.html) 

3. Dr. Filipe Matias at [Syngenta](https://www.linkedin.com/in/filipe-matias-27bab5199/)

4. Dr. Tara Enders at [Hofstra University](https://sites.google.com/view/enders-lab/people?pli=1)

5. Briony Parker at [Rothamsted Research](https://repository.rothamsted.ac.uk/staff/98225/briony-parker)

6. Dr. Fiona L. Goggin at [University of Arkansas](https://enpl.uark.edu/people/faculty/uid/fgoggin/name/Fiona+Goggin/)


<br/><br/> 


## Imaging protocol for SMART


Input image requirement:

Plant top view image captured by any RGB camera, prefer a black background with stable illumination environment. 


![Optional Text](../main/media/SPAD_imaging.jpg)

Setting up plants

    1. Place one plant in one tray.
    2. Use black color mesh to cover the soil.
    3. Place the maker object on the left corner of the tray.
    4. Prefer the plant did not grow out of the boundaries of the tray.


![Optional Text](../main/media/camera.jpg)
Setting up camera

    1. The camera lens should be parallel to the plant surface to capture an undistorted top view. 
    2. The plant object should be in the center of the image and within the focus of the camera lens.
    3. The depth of field should cover the different layers of the plant leaves. 
    4. Higher resolution (e.g., an 8-megapixel camera produces a file size that is 2448 x 3264 PPI) is suggested to acquire clear and sharp image data.


![Optional Text](../main/media/temp_imaging.jpg)
Setting up the lighting environment

    1. Diffuse lighting is suggested. 
    2. Reduce shadow as much as possible.
    3. Keep the illumination environment constant between imaging different plants. 
    4. Avoid overexposure and reflection effects.


