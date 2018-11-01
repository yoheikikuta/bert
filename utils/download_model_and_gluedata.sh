# Download BERT model.
DIR=/work/model
if [[ ! -e $DIR ]]; then
    mkdir $DIR
fi

DIR_BASE_UNCASED=$DIR/base_uncased
if [[ ! -e $DIR_BASE_UNCASED ]]; then
    mkdir $DIR_BASE_UNCASED
fi

SAVEPATH=$DIR_BASE_UNCASED/uncased_L-12_H-768_A-12.zip
URL=https://storage.googleapis.com/bert_models/2018_10_18/uncased_L-12_H-768_A-12.zip

wget -O $SAVEPATH $URL
unzip $SAVEPATH -d $DIR_BASE_UNCASED && rm $SAVEPATH


# Download GLUE data.
DATADIR=/work/data
if [[ ! -e $DATADIR ]]; then
    mkdir $DATADIR
fi

python3 /work/utils/download_glue_data.py --data_dir $DATADIR --tasks all
