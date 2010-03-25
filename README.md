# HL7 Structured Document Template Design Pilot with hData #

## Overview ##

This repository contains code that will allow you to translate hData Records into CDA documents and vice versa for the CDA R2 Tuberculosis Follow Up Progress Note. A full description of the information contained in the progress note can be found on the [Structured Document Template Design Pilot Page](http://wiki.hl7.org/index.php?title=Structured_Document_Template_Design_Pilot).

## Technical Approach ##

The first part of this project was to come up with an [hData Content Profile](http://www.projecthdata.org/glossary.html) so that the progress note could be represented in the [hData Record Format](http://www.projecthdata.org/documents/pubs/hData%20Record%20Format-v8.pdf). The creation of the Content Profile was fairly trivial due to previous work on the hData project. We have been working on a Continuity of Care Content Profile which is based on the [HITSP C32](http://hitsp.org/ConstructSet_Details.aspx?&PrefixAlpha=4&PrefixNumeric=32), which is a profile of the HL7 CCD. Since this pilot uses CCD results and organizers, as well as person information, our existing hData schemas could be reused. 

The hData Content Profile provided a structure to map information from the progress note to. For the CDA based version of the progress note, we wanted to have more structured framework to map to beyond the CDA schema. For this, we again leveraged existing work. MITRE had previously produced a project called [L32](http://www.projecthdata.org/l32.html). This was an effort to create a strongly typed XML Schema for HITSP C32 documents. We are reusing the [L32 Schemas](http://github.com/projecthdata/L32) for Person Information and Results, with modification to help us map to CDA based progress note.

We then used [Altova MapForce](http://www.altova.com/mapforce.html) to map between the XML Schemas of the two architectures. MapForce creates XSLT that can be used in conjunction with [XProc](http://www.w3.org/TR/xproc/) to go from hData to CDA and vice versa.

## Repository Overview ##

* cda-examples - Contains an example CDA R2 Tuberculosis Follow Up Progress Note
* hdata-examples - Contains a simple hData Record that conforms to the hData Tuberculosis Follow Up Progress Note Content Profile
* hdata-schemas - The XML Schemas that define the hData Tuberculosis Follow Up Progress Note Content Profile
* l32-schemas - Repurposed L32 XML Schemas that have been updated to conform to the CDA R2 Tuberculosis Follow Up Progress Note
* mappings - The Altova MapForce files that were used to generate the XSLT to translate hData to/from CDA
* pipeline - XProc pipelines to run the XSLT needed to translate hData to/from CDA

## Requirements ##

This project requires [Apache Ant](http://ant.apache.org/) to run the included build file. It uses the [Calabash](http://xmlcalabash.com/) XProc processor to run the pipelines, which is included in this repository under pipeline/lib. Calabash can be used directly without Ant, but you will need to supply the appropriate environment for Java on the command line. Finally, Calabash relies on [Saxon](http://saxon.sourceforge.net/), which is also included in this repository.

## Running ##

From the pipeline directory, you will can execute Ant targets to run the XProc pipelines. To take the sample CDA document and create an hData Record, run:

    ant cda-to-hdata

This will create an hData Record in a folder called tmp-hdata based on the CDA document in cda-examples.

You can also run

    ant hdata-to-cda

This will create a CDA Document in the output stream based on the hData Record in hdata-examples.

## License

Copyright 2010 The MITRE Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
