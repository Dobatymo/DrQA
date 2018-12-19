mkdir "data"
mkdir "datasets"

rem Download main hosted data
wget -c -O "data/data.tar.gz" "https://s3.amazonaws.com/fair-data/drqa/data.tar.gz"

rem Untar
tar -xvf "data/data.tar.gz"

rem Remove tar ball
rem del "data/data.tar.gz"

rem Get SQuAD train
wget -O "datasets/SQuAD-v1.1-train.json" "https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v1.1.json"
py "scripts/convert/squad.py" "datasets/SQuAD-v1.1-train.json" "datasets/SQuAD-v1.1-train.txt"

rem Get SQuAD dev
wget -O "datasets/SQuAD-v1.1-dev.json" "https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v1.1.json"
py s"cripts/convert/squad.py" "datasets/SQuAD-v1.1-dev.json" "datasets/SQuAD-v1.1-dev.txt"

rem Download official eval for SQuAD
curl "https://worksheets.codalab.org/rest/bundles/0xbcd57bee090b421c982906709c8c27e1/contents/blob/" >  "./scripts/reader/official_eval.py"

rem Get WebQuestions train
wget -O "datasets/WebQuestions-train.json.bz2" "http://nlp.stanford.edu/static/software/sempre/release-emnlp2013/lib/data/webquestions/dataset_11/webquestions.examples.train.json.bz2"
bunzip2 -f "datasets/WebQuestions-train.json.bz2"
py "scripts/convert/webquestions.py" "datasets/WebQuestions-train.json" "datasets/WebQuestions-train.txt"
rem del "datasets/WebQuestions-train.json"

rem Get WebQuestions test
wget -O "datasets/WebQuestions-test.json.bz2" "http://nlp.stanford.edu/static/software/sempre/release-emnlp2013/lib/data/webquestions/dataset_11/webquestions.examples.test.json.bz2"
bunzip2 -f "datasets/WebQuestions-test.json.bz2"
py "scripts/convert/webquestions.py" "datasets/WebQuestions-test.json" "datasets/WebQuestions-test.txt"
rem del "datasets/WebQuestions-test.json"

rem Get freebase entities for WebQuestions
wget -O "datasets/freebase-entities.txt.gz" "https://s3.amazonaws.com/fair-data/drqa/freebase-entities.txt.gz"
gzip -d "datasets/freebase-entities.txt.gz"
