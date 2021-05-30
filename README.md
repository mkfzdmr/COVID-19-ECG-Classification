# Classification of COVID-19 electrocardiograms by using hexaxial feature mapping and deep learning

**Ozdemir, M. A. et al. (2021).** [Classification of COVID-19 electrocardiograms by using hexaxial feature mapping and deep learning](https://rdcu.be/clAU0), BMC Medical Informatics and Decision Making.


![Figure 1](https://user-images.githubusercontent.com/15153217/120105662-983ca880-c162-11eb-9bd8-1389b8750dd8.png)


**Abstract** 
<br/>
**Background** <p align="justify">Coronavirus disease 2019 (COVID-19) has become a pandemic since its first appearance in late 2019. Deaths caused by COVID-19 are still increasing day by day and early diagnosis has become crucial. Since current diagnostic methods have many disadvantages, new investigations are needed to improve the performance of diagnosis.</p>

**Methods**
<p align="justify">A novel method is proposed to automatically diagnose COVID-19 by using Electrocardiogram (ECG) data with deep learning for the first time. Moreover, a new and effective method called hexaxial feature mapping is proposed to represent 12-lead ECG to 2D colorful images. Gray-Level Co-Occurrence Matrix (GLCM) method is used to extract features and generate hexaxial mapping images. These generated images are then fed into a new Convolutional Neural Network (CNN) architecture to diagnose COVID-19.</p>

**Results**
<p align="justify">Two different classification scenarios are conducted on a publicly available paper-based ECG image dataset to reveal the diagnostic capability and performance of the proposed approach. In the first scenario, ECG data labeled as COVID-19 and No-Findings (normal) are classified to evaluate COVID-19 classification ability. According to results, the proposed approach provides encouraging COVID-19 detection performance with an accuracy of 96.20% and F1-Score of 96.30%. In the second scenario, ECG data labeled as Negative (normal, abnormal, and myocardial infarction) and Positive (COVID-19) are classified to evaluate COVID-19 diagnostic ability. The experimental results demonstrated that the proposed approach provides satisfactory COVID-19 prediction performance with an accuracy of 93.00% and F1-Score of 93.20%. Furthermore, different experimental studies are conducted to evaluate the robustness of the proposed approach.</p>

**Conclusion**
<p align="justify">Automatic detection of cardiovascular changes caused by COVID-19 can be possible with a deep learning framework through ECG data. This not only proves the presence of cardiovascular changes caused by COVID-19 but also reveals that ECG can potentially be used in the diagnosis of COVID-19. We believe the proposed study may provide a crucial decision-making system for healthcare professionals.</p>

**Keywords:** COVID-19, ECG, Paper-based ECG, GLCM, Hexaxial mapping, Deep learning, Convolutional neural network, Diagnosis

## Content
This repository is built on 2 main structures.
### First Part: Generating Hexaxial Mapping Images
* [Original ECG Image Dataset](/covid19_ECG/original_dataset/dataset_doi.txt)
* **[[NEW] Pre-processed and segmented paper-based ECG image database](covid19_ECG/preprocessed_dataset)**

  ![Figure 2](https://user-images.githubusercontent.com/15153217/120110997-aeedfa00-c178-11eb-984f-6d192d3d670a.png)
  This step is detailed in the [paper](s12911-021-01521-x.pdf). First, raw data is taken from the current database, then this ECG data are preprocessed and segmented, and finally segmented and filtred from background noises ECG parts are obtained. Following codes doing these preocess for each group: [MI](covid19_ECG/MI_imge_ayiklama.m), [Abnormal](covid19_ECG/abnormal_imge_ayiklama.m), [COVID-Type1](covid19_ECG/covid_imge_ayiklama_type1.m), [COVID-Type2](covid19_ECG/covid_imge_ayiklama_type2.m), [COVID-Type3](covid19_ECG/covid_imge_ayiklama_type3.m), [Positive](covid19_ECG/positive_imge_ayiklama.m), and [Normal or Negative](normal_imge_ayiklama.m). Also, these codes generate the GLCM properties related to each ECG type. (You do not need run this codes block because in next step you can find generated GLCM proporties)
  
* Obtained GLCM features of [Abnormal](covid19_ECG/abnormal_statistical_total.mat), [COVID](covid19_ECG/covid_statistical_total.mat), [MI](covid19_ECG/mi_statistical_total.mat), [Negative](covid19_ECG/negative_energies_normalized.mat), [Normal](covid19_ECG/normal_statistical_total.mat), and [Positive](covid19_ECG/positive_energies_normalized.mat).
Labels:  
You can find statistical analysis: [Statistical Analysis](covid19_ECG/statistical_difference.m).
* [3D Coordinate Calculation of Hexaxial Mapping Process](covid19_ECG/coordinates_calculation.m)
* [3D to 2D Location Mapping](covid19_ECG/map_2D.m)
* [Hexaxial Mapping Process for Covid vs Normal](covid19_ECG/features_map_covidvsNormal.m)
* [Hexaxial Mapping Process for Negative vs Positive](covid19_ECG/features_map_negativeVSpositive.m)
* **[Final Hexaxial Map Images](covid19_ECG/feature_maps)**

  ![Figure 4](https://user-images.githubusercontent.com/15153217/120113431-1f017d80-c183-11eb-8a06-8605f0d589b6.png)

  You can find detailed codes of first stage in [covid19_ECG](covid19_ECG).

### Second Part: Building Deep Network and Training
First of all, it is necessary to move the hexaxial feature map images or 2D ECG images obtained in the first step (whichever is desired to be trained) to the relevant dataset file in the [covid_ECG_training](/covid_ECG_training) folder. 

* [Modified AlexNet Architecture](/covid_ECG_training/mimarilerim/alexnet_modified.py)
* [Training and Evaulating Code](/covid_ECG_training/train_network_covidECG_CV.py)
  
  Detailed explanation is included in the code.
* Results

![Figure 8](https://user-images.githubusercontent.com/15153217/120113403-02fddc00-c183-11eb-9966-d735552231bc.png)


## DOI

https://doi.org/10.1186/s12911-021-01521-x

## Web Site

https://bmcmedinformdecismak.biomedcentral.com/articles/10.1186/s12911-021-01521-x

## Citation

Citation is now available. Please cite us by following;

Ozdemir, M.A., Ozdemir, G.D. & Guren, O. Classification of COVID-19 electrocardiograms by using hexaxial feature mapping and deep learning. BMC Med Inform Decis Mak 21, 170 (2021). https://doi.org/10.1186/s12911-021-01521-x

```
@article{ozdemir2021covidECG,
  title={Classification of COVID-19 electrocardiograms by using hexaxial feature mapping and deep learning},
  author={Ozdemir, Mehmet Akif and Ozdemir, Gizem Dilara and Guren, Onan},
  journal={BMC Medical Informatics and Decision Making},
  volume={21},
  number={1},
  pages={1--20},
  year={2021},
  doi={10.1186/s12911-021-01521-x},
  url={https://doi.org/10.1186/s12911-021-01521-x},
  publisher={BioMed Central}
}
```
Cite from [Endnote](https://citation-needed.springer.com/v2/references/10.1186/s12911-021-01521-x?format=refman&flavour=citation)
Cite from [BiomedCentral](https://bmcmedinformdecismak.biomedcentral.com/articles/10.1186/s12911-021-01521-x#article-info) or Cite from [Google Scholar](https://scholar.google.com/scholar?hl=tr&as_sdt=0%2C5&q=Classification+of+COVID-19+electrocardiograms+by+using+hexaxial+feature+mapping+and+deep+learning&btnG=) 

## Additional Information
[Peer Review History](https://bmcmedinformdecismak.biomedcentral.com/articles/10.1186/s12911-021-01521-x/peer-review)

[Altmetric](https://bmcmedinformdecismak.biomedcentral.com/articles/10.1186/s12911-021-01521-x/metrics)

[PubMed ID:34034715](https://pubmed.ncbi.nlm.nih.gov/34034715/)

## Contact
If you need any help, feel free to start an issue (preferred because other people can benefit) or send me an email: [makif.ozdemir@ikcu.edu.tr](mailto:makif.ozdemir@ikcu.edu.tr)
