import base64, zmq

def consumer():
    IP = "tcp://18.232.52.148:5557"
    print('consumer started...Ingest images from ', IP)
    context = zmq.Context()
    # recieve work
    consumer_receiver = context.socket(zmq.PULL)
    consumer_receiver.connect(IP)
    receiving_dir = '/Users/Xiaoqing/Insight/CV2capture/Received/'
    while True:
        meta_data = consumer_receiver.recv_json()
        saving_path = receiving_dir+meta_data['filename']
        message = consumer_receiver.recv()
        with open(saving_path, 'wb') as f:
            buff = base64.b64decode(message)
            f.write(buff)
        print('image received with boxes:',meta_data['boxes'])

if __name__=="__main__":
    consumer()
