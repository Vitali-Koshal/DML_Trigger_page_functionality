public with sharing class AccountExtensionStandartContr {
    public AccountExtensionStandartContr() {

    }
    public PageReference Save() {
        PageReference currentPage=ApexPages.currentPage();
        return currentPage;
    }
}
