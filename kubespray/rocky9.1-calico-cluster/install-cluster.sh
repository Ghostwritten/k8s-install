#!/bin/bash

# 定义颜色变量
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
NC="\033[0m"

echo -e "${GREEN} 欢迎使用 Kubespray 工具部署 k8s！${NC}"
echo ""


create_kubespray(){
  VERSION=v2.21.0
  if [ "$(docker ps -q -f name=kubespray-${VERSION})" ]; then
     echo -e "$RED容器 kubespray-${VERSION} 已经存在！${NC}"
     echo ''
  else
     docker run --name=kubespray-${VERSION} --network=host --rm -itd --mount type=bind,source="$(pwd)"/inventory/cluster-local,dst=/inventory \
     --mount type=bind,source="${HOME}"/.ssh,dst=/root/.ssh \
     --mount type=bind,source=/etc/hosts,dst=/etc/hosts \
     quay.io/kubespray/kubespray:${VERSION} bash
     echo -e "$RED容器 kubespray-${VERSION} 创建成功！${NC}"
     echo ''
  fi

}

install_k8s() {
  echo -e "${GREEN} 现在你可以开始安装 k8s:${NC}"
  echo ''
  printf "   1. ${YELLOW}%s${NC}\n"  "docker attach kubespray-${VERSION} "
  printf "   2. ${YELLOW}%s${NC}\n"  "pip3 install jmespath "
  printf "   3. ${YELLOW}%s${NC}\n"  "ansible-playbook -i /inventory/inventory.ini --private-key /root/.ssh/id_rsa cluster.yml"
}

create_kubespray
install_k8s
