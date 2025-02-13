#!/bin/bash
 
#SBATCH --nodes=2                    # 1 node
#SBATCH --ntasks-per-node=1         # 32 tasks per node
#SBATCH --time=0:30:00               # time limit: 1 hour
#SBATCH --error=train.err            # standard error file
#SBATCH --output=train.out           # standard output file
#SBATCH --account=EUHPC_A04_051       # account name
#SBATCH --qos=boost_qos_dbg
#SBATCH --partition=boost_usr_prod
#SBATCH --gres=gpu:4

source $WORK/oumi-dev-env/bin/activate

cd $HOME/llama-train

oumi train -c train.yaml
