{if $contactid}

<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>

{include file="$template/pageheader.tpl" title=$LANG.clientareanavcontacts}

{include file="$template/clientareadetailslinks.tpl"}

{if $successful}
<div class="alert alert-success">
    <p>{$LANG.changessavedsuccessfully}</p>
</div>
{/if}

{if $errormessage}
<div class="alert alert-danger">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$errormessage}
    </ul>
</div>
{/if}

<script type="text/javascript">
{literal}
jQuery(document).ready(function(){
    jQuery("#subaccount").click(function () {
        if (jQuery("#subaccount:checked").val()!=null) {
            jQuery("#subaccountfields").slideDown();
        } else {
            jQuery("#subaccountfields").slideUp();
        }
    });
});
{/literal}
function deleteContact() {ldelim}
if (confirm("{$LANG.clientareadeletecontactareyousure}")) {ldelim}
window.location='clientarea.php?action=contacts&delete=true&id={$contactid}';
{rdelim}{rdelim}
</script>

<form method="post" class="form-inline" action="{$smarty.server.PHP_SELF}?action=contacts">
<div class="alert alert-block alert-info">
<p>{$LANG.clientareachoosecontact}: <select name="contactid" onchange="submit()">
    {foreach item=contact from=$contacts}
        <option value="{$contact.id}"{if $contact.id eq $contactid} selected="selected"{/if}>{$contact.name} - {$contact.email}</option>
    {/foreach}
    <option value="new">{$LANG.clientareanavaddcontact}</option>
    </select> <input class="form-control" class="btn" type="submit" value="{$LANG.go}" /></p>
</div>
</form>

<form method="post" action="{$smarty.server.PHP_SELF}?action=contacts&id={$contactid}">

<div class="col-md-6">

    <div class="form-group">
	    <label for="firstname">{$LANG.clientareafirstname}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="firstname" id="firstname" value="{$contactfirstname}" />
		</div>
	</div>

    <div class="form-group">
	    <label for="lastname">{$LANG.clientarealastname}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="lastname" id="lastname" value="{$contactlastname}" />
		</div>
	</div>

    <div class="form-group">
	    <label for="companyname">{$LANG.clientareacompanyname}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="companyname" id="companyname" value="{$contactcompanyname}" />
		</div>
	</div>

    <div class="form-group">
	    <label for="email">{$LANG.clientareaemail}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="email" id="email" value="{$contactemail}" />
		</div>
	</div>

    <div class="form-group">
	    <label for="billingcontact">{$LANG.subaccountactivate}</label>
		<div class="controls">
		    <label class="checkbox">
            <input class="form-control" type="checkbox" name="subaccount" id="subaccount"{if $subaccount} checked{/if} /> {$LANG.subaccountactivatedesc}
            </label>
		</div>
	</div>

</div>
<div class="col-md-6">

    <div class="form-group">
	    <label for="address1">{$LANG.clientareaaddress1}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="address1" id="address1" value="{$contactaddress1}" />
		</div>
	</div>

    <div class="form-group">
	    <label for="address2">{$LANG.clientareaaddress2}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="address2" id="address2" value="{$contactaddress2}" />
		</div>
	</div>

    <div class="form-group">
	    <label for="city">{$LANG.clientareacity}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="city" id="city" value="{$contactcity}" />
		</div>
	</div>

    <div class="form-group">
	    <label for="state">{$LANG.clientareastate}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="state" id="state" value="{$contactstate}" />
		</div>
	</div>

    <div class="form-group">
	    <label for="postcode">{$LANG.clientareapostcode}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="postcode" id="postcode" value="{$contactpostcode}" />
		</div>
	</div>

    <div class="form-group">
	    <label for="country">{$LANG.clientareacountry}</label>
		<div class="controls">
		    {$countriesdropdown}
		</div>
	</div>

    <div class="form-group">
	    <label for="phonenumber">{$LANG.clientareaphonenumber}</label>
		<div class="controls">
		    <input class="form-control" type="text" name="phonenumber" id="phonenumber" value="{$contactphonenumber}" />
		</div>
	</div>

</div>
</div>

</fieldset>

<div id="subaccountfields" class="well{if !$subaccount} hide{/if}">

    <div class="form-group">
	    <label for="password">{$LANG.clientareapassword}</label>
		<div class="controls">
		    <input class="form-control" type="password" name="password" id="password" />
		</div>
	</div>

    <div class="form-group">
	    <label for="password2">{$LANG.clientareaconfirmpassword}</label>
		<div class="controls">
		    <input class="form-control" type="password" name="password2" id="password2" />
		</div>
	</div>

    <div class="form-group">
	    <label for="passstrength">{$LANG.pwstrength}</label>
		<div class="controls">
            {include file="$template/pwstrength.tpl"}
		</div>
	</div>

    <div class="form-group">
	    <label class="full control-label">{$LANG.subaccountpermissions}</label>
		<div class="controls">
            <ul class="inputs-list">
                <li class="col-md-6">
                    <label class="checkbox">
                        <input class="form-control" type="checkbox" name="permissions[]" value="profile"{if in_array('profile',$permissions)} checked{/if} />
                        <span>{$LANG.subaccountpermsprofile}</span>
                    </label>
                </li>
                <li class="col-md-6">
                    <label class="checkbox">
                        <input class="form-control" type="checkbox" name="permissions[]" id="permcontacts" value="contacts"{if in_array('contacts',$permissions)} checked{/if} />
                        <span>{$LANG.subaccountpermscontacts}</span>
                    </label>
                </li>
                <li class="col-md-6">
                    <label class="checkbox">
                        <input class="form-control" type="checkbox" name="permissions[]" id="permproducts" value="products"{if in_array('products',$permissions)} checked{/if} />
                        <span>{$LANG.subaccountpermsproducts}</span>
                    </label>
                </li>
                <li class="col-md-6">
                    <label class="checkbox">
                        <input class="form-control" type="checkbox" name="permissions[]" id="permmanageproducts" value="manageproducts"{if in_array('manageproducts',$permissions)} checked{/if} />
                        <span>{$LANG.subaccountpermsmanageproducts}</span>
                    </label>
                </li>
                <li class="col-md-6">
                    <label class="checkbox">
                        <input class="form-control" type="checkbox" name="permissions[]" id="permdomains" value="domains"{if in_array('domains',$permissions)} checked{/if} />
                        <span>{$LANG.subaccountpermsdomains}</span>
                    </label>
                </li>
                <li class="col-md-6">
                    <label class="checkbox">
                        <input class="form-control" type="checkbox" name="permissions[]" id="permmanagedomains" value="managedomains"{if in_array('managedomains',$permissions)} checked{/if} />
                        <span>{$LANG.subaccountpermsmanagedomains}</span>
                    </label>
                </li>
                <li class="col-md-6">
                    <label class="checkbox">
                        <input class="form-control" type="checkbox" name="permissions[]" id="perminvoices" value="invoices"{if in_array('invoices',$permissions)} checked{/if} />
                        <span>{$LANG.subaccountpermsinvoices}</span>
                    </label>
                </li>
                <li class="col-md-6">
                    <label class="checkbox">
                        <input class="form-control" type="checkbox" name="permissions[]" id="permtickets" value="tickets"{if in_array('tickets',$permissions)} checked{/if} />
                        <span>{$LANG.subaccountpermstickets}</span>
                    </label>
                </li>
                <li class="col-md-6">
                    <label class="checkbox">
                        <input class="form-control" type="checkbox" name="permissions[]" id="permaffiliates" value="affiliates"{if in_array('affiliates',$permissions)} checked{/if} />
                        <span>{$LANG.subaccountpermsaffiliates}</span>
                    </label>
                </li>
                <li class="col-md-6">
                    <label class="checkbox">
                        <input class="form-control" type="checkbox" name="permissions[]" id="permemails" value="emails"{if in_array('emails',$permissions)} checked{/if} />
                        <span>{$LANG.subaccountpermsemails}</span>
                    </label>
                </li>
                <li class="col-md-6">
                    <label class="checkbox">
                        <input class="form-control" type="checkbox" name="permissions[]" id="permorders" value="orders"{if in_array('orders',$permissions)} checked{/if} />
                        <span>{$LANG.subaccountpermsorders}</span>
                    </label>
                </li>
            </ul>
		</div>
	</div>

</div>

    <div class="form-group">
	    <label class="control-label">{$LANG.clientareacontactsemails}</label>
		<div class="controls">
            <ul class="inputs-list">
                <li>
                    <label class="full control-label">
                        <input class="form-control" type="checkbox" name="generalemails" id="generalemails" value="1"{if $generalemails} checked{/if} />
                        <span>{$LANG.clientareacontactsemailsgeneral}</span>
                    </label>
                </li>
                <li>
                    <label class="full control-label">
                        <input class="form-control" type="checkbox" name="productemails" id="productemails" value="1"{if $productemails} checked{/if} />
                        <span>{$LANG.clientareacontactsemailsproduct}</span>
                    </label>
                </li>
                <li>
                    <label class="full control-label">
                        <input class="form-control" type="checkbox" name="domainemails" id="domainemails" value="1"{if $domainemails} checked{/if} />
                        <span>{$LANG.clientareacontactsemailsdomain}</span>
                    </label>
                </li>
                <li>
                    <label class="full control-label">
                        <input class="form-control" type="checkbox" name="invoiceemails" id="invoiceemails" value="1"{if $invoiceemails} checked{/if} />
                        <span>{$LANG.clientareacontactsemailsinvoice}</span>
                    </label>
                </li>
                <li>
                    <label class="full control-label">
                        <input class="form-control" type="checkbox" name="supportemails" id="supportemails" value="1"{if $supportemails} checked{/if} />
                        <span>{$LANG.clientareacontactsemailssupport}</span>
                    </label>
                </li>
            </ul>
		</div>
	</div>

</fieldset>

  <div class="form-actions">
    <input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
    <input class="btn" type="reset" value="{$LANG.cancel}" />
    <input class="btn btn-danger" type="button" value="{$LANG.clientareadeletecontact}" onclick="deleteContact()" />
  </div>

</form>

{else}

{include file="$template/clientareaaddcontact.tpl"}

{/if}