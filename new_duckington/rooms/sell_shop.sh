#!/bin/bash


sell_shop() {

	echo -e "${RED}===================${NC}"
	echo -e "${CYAN}The Shop...${NC}"
	echo -e "${RED}===================${NC}"
	echo 
	echo
	while true; do
		printf "What Do You Want To Sell?"
		echo
		echo "-------------------"
		echo -e "${YELLOW}[1]  Buy $item1${NC}" 
		echo -e "${GREEN}[2]  Buy $item2${NC}"
		echo -e "${BLUE}[3]  Buy $item3${NC}"
		echo -e "${PINK}[4]  Buy $item4${NC}"
		echo -e "${RED}[5]  EXIT SHOP${NC}"
		read shop_action
}