## Redirection

The two following components have been split since August 8th 2018 for modularity.

-  See [rnaclu](https://github.com/shouldsee/rnaclu) for python2 package that clusters trancript abundance matrix,

-  See [synoBio](https://github.com/shouldsee/synoBio), for command-line pipelines that process raw NGS `.fastq`, 

## Usage

- Create a new environment:

```sh
git clone https://github.com/schwarz-b/synoBio /tmp/synoBio_src
mkdir /tmp/myEnv
cd /tmp/myEnv
source /tmp/synoBio_src/init.sh
```

- Activate your environment

```sh
source /tmp/myEnv/activate.sh
```

- Align your samples 

```sh
SRC=/tmp/synoBio_src
mkdir -p ./temp_job; cd ./temp_job
/tmp/myEnv/bin/pipeline_rnaseq.sh $SRC/examples/data/test_R1_.fastq $SRC/examples/data/test_R1_.fastq
```
## Prerequisites

The following software is added to the new environment. Have the software (versions used here are indicated) downloaded to a local folder and adjust paths accordingly in init.sh:
- FastQC (2.1.1), Trimmomatic (0.39), HISAT2 (2.1.0, for pipeline_rnaseq.sh), Bowtie2 (2.4.1, for pipeline_chipseq_pe|se.sh), Samtools (1.10), Picard (2.22.1), StringTie (2.1.1)

Have the following installed on your local computer:
- Python 2.7 and Python 3.7 (Python 3.7 must be the default)
- deepTools (3.4.3, for bamCoverage tool)
- MACS2 (2.2.7.1, only for ChIP-Seq peak calling; pipeline_callpeak_inplace.sh)

Have reference genome, indexed reference genome, annotation files (GTF, GFF), genome size file, adapter sequences saved to local folder and adjust paths accordingly in config.sh files. 

# Before aligning your actual samples:

- Source appropriate config file

```sh
source /tmp/myEnv/config_Ath_TAIR10.sh #example config
```

## You can also directly align illumina output samples (4 lanes per flow cell):

The following pipeline includes pre-processing of the illumina samples. It also writes the pipeline output into a defined directory.

- Aligning illumina output samples

```sh
#example RNA-seq paired-end reads
pipeline_mapper.sh -p -t 6 /path/to/input/dir pipeline_rnaseq.sh /path/to/output/dir #-p: paired end, -t 6: number of threads

#example ChIP-seq paired-end reads
pipeline_mapper.sh -p -t 6 /path/to/input/dir pipeline_chipseq_pe.sh /path/to/output/dir
```
*/path/to/input/dir: directory containing the .fastq(.gz) files to be processed (8 files for paired-end reads)
