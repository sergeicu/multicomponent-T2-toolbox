
##########
# Setup environment 
##########

# git clone 
git clone https://github.com/sergeicu/multicomponent-T2-toolbox.git
cd multicomponent-T2-toolbox

# create virtual environment 
mkdir -p venv
python3 -m venv $PWD/venv

# checkout correct branch 
git checkout crl
git pull origin crl

# activate environment 
source venv/bin/activate

# install all python libraries
pip install -r requirements.txt


##########
# Run analysis on single nifti file (using best method, as noted from empirical studies)
##########

# WARNING: check that you are running python==3.8.6 (or just ssh to ankara). 
# This code did not work on python==3.6 (installed on istanbul by default) 
python3 --version 

# locate codedir (installed for onur) 
codedir=/fileserver/fastscratch/serge/for_onur/multicomponent-T2-toolbox

# activate python 
source $codedir/venv/bin/activate 

# provide name of nifti 
f=<4D_nifti>

# [optional] create mask file 
python3 $codedir/create_seg.py $f

# provide mask file 
mask=<mask_file>

# run 
python3 $codedir/run_real_data_script.py --input $f --minTE 8.2 --nTE 18 --TR 1000 --path_to_folder $PWD/ \
    --mask $mask --savefig no --savefig_slice 0 --FA_method spline --FA_smooth no --denoise TV \
    --reg_method T2SPARC \
    --reg_matrix I \
    --myelin_T2_cutoff 30

