/**
 * Created with JetBrains RubyMine.
 * User: Personal
 * Date: 25/08/13
 * Time: 18:27
 * To change this template use File | Settings | File Templates.
 */

function assignBranchValidation() {
    $("#new_branch").removeAttr("novalidate");

    $("#branch_name").attr("required",true);
    $("#branch_name").attr("pattern",".{4,25}");
    $("#branch_name").attr("title","4 a 25 caracteres");
    $("#branch_address_attributes_street").attr("required",true);
    $("#branch_address_attributes_number").attr("required",true);
    $("#branch_address_attributes_number").attr("pattern","{1,6}");
    $("#branch_address_attributes_city").attr("required",true);
    $("#branch_address_attributes_state").attr("required",true);
    $("#branch_address_attributes_country_id").attr("required",true);
}

function assignOfferValidation() {
    $("#new_offer").removeAttr("novalidate");
    $("#offer_name").attr("required",true);
    $("#offer_branch_id").attr("required",true);
    $("#offer_start_date").attr("required",true);
    $("#offer_start_date").attr("pattern","(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}");
    $("#offer_end_date").attr("required",true);
    $("#offer_end_date").attr("pattern","(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}");
}

