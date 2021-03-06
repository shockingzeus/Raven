export GPUTEST=ubuntu@ec2-18-232-52-148.compute-1.amazonaws.com
export CAM2=ubuntu@ec2-34-204-187-162.compute-1.amazonaws.com
export CAM1=ubuntu@ec2-34-230-217-197.compute-1.amazonaws.com
export STREAMER=ubuntu@ec2-3-94-202-156.compute-1.amazonaws.com


ssh -i ~/.ssh/xiaoqingzhou-IAM-keypair.pem ubuntu@ec2-18-205-41-211.compute-1.amazonaws.com

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

bash Miniconda3-latest-Linux-x86_64.sh

conda create -n insight python=3.6

conda install -c conda-forge opencv

conda activate insight

conda install jupyter

conda install -c anaconda zeromq

scp frozen_inference_graph.pb $GPUTEST:/home/ubuntu/frozen_inference_graph.pb
