#!/bin/bash
 
#SBATCH --nodes=2                    # 1 node
#SBATCH --ntasks-per-node=1      
#SBATCH --cpus-per-task=32           # 32 threads per node
#SBATCH --time=0:30:00               # time limit: 1 hour
#SBATCH --error=train.err            # standard error file
#SBATCH --output=train.out           # standard output file
#SBATCH --account=EUHPC_A04_051       # account name
#SBATCH --qos=boost_qos_dbg
#SBATCH --partition=boost_usr_prod
#SBATCH --gres=gpu:4

source $WORK/oumi-dev-env/bin/activate

cd $HOME/llama-train

if [ x$SLURM_CPUS_PER_TASK == x ]; then
  export OMP_NUM_THREADS=1
else
  export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
fi

oumi distributed torchrun -m oumi train -c train.yaml
