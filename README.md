# Text Recognition API on AWS lambda

## Setup project locally
- Clone repository
- `cd` into project directory
- Create virtual environment `python -m venv env`
- In project directory and on the terminal run `source env/bin/activate` to activate the virtual environment

## Basic usage
- To run project locally, using the base64 encoded value of the `sample.png` image in the project root directory
  - in the terminal, in project directory and env activated
  - uncomment Line of Code #18 to #22
  - run `python3 python/main.py`
  - text extracted from the image, should be printed out in the terminal
 
- To generate the base64 encoded url for the `sample.png` image in the project root directory
  - run `python3 python/encode_image.py`
  - copy resulting text in the terminal, copy all text between `b''`
  - paste text in `image.json` as `image_data` value

- To generate the real image from the base64 encoded string
  - run `python3 python/decode_image.py`
  - check project root and a file called `out_sample.png` should be created