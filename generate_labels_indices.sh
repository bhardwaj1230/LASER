
# Modification for creating labels for Classification task and generating matched Indices for Corpus Cleaning.
# No changes was made in LASER model, only modified the output of the model.

export LASER='./'
if [ -z ${LASER+x} ] ; then
  echo "Please set the environment variable 'LASER'"
  exit
fi

model_dir="${LASER}/models"
encoder="${model_dir}/bilstm.93langs.2018-12-26.pt"
bpe_codes="${model_dir}/93langs.fcodes"
edir="embed"


python ${LASER}//source/similarity_search.py --bpe-codes ${bpe_codes} --encoder ${encoder} \
         --base-dir . --data /fs/hestia_Hnrc/ict/bha101/nrc_collab_aitq/mac_hum/laser/xlm/data/test.en-fr \
         --output ${edir}/test_laser \
         --lang en fr --verbose
