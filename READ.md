This docker service is executed following this docs:
https://docs.openvino.ai/2025/model-server/ovms_docs_llm_quickstart.html



**Run this to create OpenVINO container:** <br>

mkdir models<br>
docker run --user $(id -u):$(id -g) -d --device /dev/dri --group-add=$(stat -c "%g" /dev/dri/render* | head -n 1) --rm -p <_port_>:<_port_> -v $(pwd)/models:/models:rw openvino/model_server:latest-gpu --source_model <model_name_from_hugging_face> --model_repository_path models --task text_generation --rest_port <_port_> --target_device GPU --cache_size 2


**Example:**<br>


**OpenVINO/Phi-3.5-mini-instruct-int4-ov**<br>
mkdir models<br>
docker run --user $(id -u):$(id -g) -d --device /dev/dri --group-add=$(stat -c "%g" /dev/dri/render* | head -n 1) --rm -p 7000:7000 -v $(pwd)/models:/models:rw openvino/model_server:latest-gpu --source_model OpenVINO/Phi-3.5-mini-instruct-int4-ov --model_repository_path models --task text_generation --rest_port 7000 --target_device GPU --cache_size 2


**llmware/llama-3.1-instruct-ov**<br>
mkdir models<br>
docker run --user $(id -u):$(id -g) -d --device /dev/dri --group-add=$(stat -c "%g" /dev/dri/render* | head -n 1) --rm -p 7001:7001 -v $(pwd)/models:/models:rw openvino/model_server:latest-gpu --source_model llmware/llama-3.1-instruct-ov --model_repository_path models --task text_generation --rest_port 7001 --target_device GPU --cache_size 2