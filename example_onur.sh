
##########
# Setup environment 
##########

# git clone 
git clone git@github.com:sergeicu/multicomponent-T2-toolbox.git
cd multicomponent-T2-toolbox

# check python - it should be python 3+
python --version 

# create virtual environment 
mkdir -p venv
python3 -m venv $PWD/venv

# activate environment 
source venv/bin/activate

# install all python libraries
pip install -r requirements.txt


##########
# Run analysis on single nifti file (using best method, as noted from empirical studies)
##########

# setup 
codedir=<path_to_repository>
f=<4D_nifti>

# run 
python $codedir/run_real_data_script.py --input $f --minTE 8.2 --nTE 18 --TR 1000 --path_to_folder $PWD/ \
    --mask mask.nii.gz --savefig no --savefig_slice 0 --FA_method spline --FA_smooth no --denoise TV \
    --reg_method T2SPARC \
    --reg_matrix I \
    --myelin_T2_cutoff 30

