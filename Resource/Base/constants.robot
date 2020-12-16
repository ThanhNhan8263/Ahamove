*** Variables ***
${BTN_INDIVIDUAL}  xpath://*[@class='business__types']/div[1]
${BTN_SMEs}  xpath://*[@class='business__types']/div[2]
${BTN_CORPORATE}  xpath://*[@class='business__types']/div[3]

${BTN-SAVE}  xpath://*[@class='v-btn v-btn--depressed theme--light accent']
${MNU_CAT}  xpath://*[@class='category__label__content-placeholder']

${HOME_MNU} =  xpath://*[@class='v-toolbar__content']
${MNU_PROFILE} =  xpath://*[@class='v-list__tile v-list__tile--avatar theme--light']
${MNU_CAT_PROFILE} =  xpath://*[@class='category']

${TXT_SEARCH_CAT} =  xpath://*[@class='v-input v-text-field v-text-field--placeholder theme--light']
${TXB_SEARCH_CAT} =  xpath://input[contains(@placeholder,'Nhập')]