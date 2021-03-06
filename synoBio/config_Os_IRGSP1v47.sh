######################################
#### Hand-coded environment variables
#### $GFF,$GTF,$IDX_HISAT,$GSIZE should have been defined before proceeds

####### Adapter FASTA
ADADIR="/home/birte/IGZ_data/software/Trimmomatic-0.39/adapters"
export FA_ADAPTER_SE="$ADADIR/TruSeq3-SE.fa"
export FA_ADAPTER_PE="$ADADIR/TruSeq3-PE-2.fa"

export GNAME="Oryza_sativa-IRGSP1v47"
export REF=/home/birte/IGZ_data/ref/Oryza_sativa_IRGSP1-v47
###### Genome annotation .gtf and .gff3 (optional)
export GTF=$(echo $REF/annotation/*.gtf)
export GFF=$(echo $REF/annotation/*.gff3)
export GSIZE="$REF/genome.sizes"
export FA_GENOME="$REF/genome.fa"

A=$(ls -1 $REF/sequence/Bowtie2Index/* | head -1)
export IDX_BOWTIE2=${A%%.*}

###### HISAT2 index
A=$(ls -1 $REF/sequence/HISAT2Index/* | head -1)
export IDX_HISAT2=${A%%.*}

#export DB_MOTIF=" \
#/home/birte/IGZ_data/ref/motif/ARABD/ArabidopsisPBM_20140210.meme\
#"
#/home/feng/ref/motif/CIS-BP/Brachypodium_distachyon.meme \

checkVars GTF GFF GSIZE FA_ADAPTER_SE FA_ADAPTER_PE REF IDX_BOWTIE2 IDX_HISAT2 FA_GENOME 
export GLEN=`size2sum $GSIZE`

#### Hand-coded environment variables
######################################
