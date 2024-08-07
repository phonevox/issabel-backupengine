{literal}
<script type="text/javascript">

    function ChequearTodos(chkbox) {
        for (var i = 0; i < document.getElementById("backup_form").elements.length; i++) {
            var elemento = document.getElementById("backup_form").elements[i];
            if (elemento.type == "checkbox") {
                if (!elemento.disabled)
                    elemento.checked = chkbox.checked
            }
        }
    }
    function ChequearTabla(chkbox, id) {
        //Si desmarco el checkbox desmarcar all options global
        if (!chkbox.checked)
            document.getElementById('backup_total').checked = chkbox.checked;

        var arr_chk = document.getElementById(id).getElementsByTagName("INPUT");
        for (var i = 0; i < arr_chk.length; i++) {
            if (!arr_chk[i].disabled)
                arr_chk[i].checked = chkbox.checked;
        }
    }
    function VerificarCheck(chkbox, id) {
        if (!chkbox.checked) {
            //Descarmar all options de la tabla
            document.getElementById(id).checked = chkbox.checked;
            //Descarmar all options global
            document.getElementById('backup_total').checked = chkbox.checked;
        }
    }
    function popup_dif(content_popup) {
        var ancho = 800;
        var alto = 110;
        var winiz = (screen.width - ancho) / 2;
        var winal = (screen.height - alto) / 2;
        my_window = window.open(content_popup, "my_window", "width=" + ancho + ",height=" + alto + ",top=" + winal + ",left=" + winiz + ",location=no,status=no,resizable=no,scrollbars=no,fullscreen=no,toolbar=no,directories=no");
        my_window.document.close();
    }
</script>
{/literal}
<form method="POST" enctype="multipart/form-data" id="backup_form">

    <div>

        <div>
            <table width="100%" cellpadding="4" cellspacing="0" border="0">
                <tr>
                    <td align="left">{$ERROR_MSG}</td>
                </tr>
                <tr>
                    <td align="left">
                        <input class="button" type="submit" name="process" value="{$PROCESS}">
                        <input class="button" type="submit" name="back" value="{$BACK}">
                    </td>
                </tr>
                <tr>
                    <td>{$WARNING}</td>
                </tr>
            </table>
            </td>
        </div>

        <div style="display: grid;">

            <div>
                <tr>
                    <td colspan=4><INPUT type="checkbox" name="backup_total" id="backup_total"
                            onClick=ChequearTodos(this);><b>{$LBL_TODOS}</b></td>
                </tr>
            </div>
            <!--  -->


            <!-- ///////////////////////////// QUEBRA AQUI ////////////////////////////////////// -->
            <div style="display: grid; grid-template-columns: repeat(3, 1fr); align-items: start;">

                <!-- ********** E N D   P O I N T ************ -->
                <table id="table_endpoint" width="100%" border="0" cellspacing="0" cellpadding="0" class="tabForm">
                    <th>
                        <tr>
                            <td height="20px"><b>{$ENDPOINT}</b></td>
                        </tr>
                        <tr>
                            <td height="20px"><INPUT type="checkbox" name="backup_endpoint" id="backup_endpoint"
                                    onClick="ChequearTabla(this, 'table_endpoint');"><b>{$TODO_ENDPOINT}</b>
                            </td>
                        </tr>
                    </th>
                    <tbody>
                        {foreach key=key item=item from=$backup_endpoint}
                        <tr>
                            <td height="20px"><INPUT type="checkbox" {$item.disable} name="{$key}" id="{$key}"
                                    value="{$key}" onClick="VerificarCheck(this, 'backup_endpoint');"
                                    {$item.check}><span {if !empty($item.disable)}style="text-decoration: line-through"
                                    {/if}>{$item.desc}&nbsp;{$item.msg}</span></td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>

                <!-- ********** F A X ************ -->
                <table id="table_fax" width="100%" border="0" cellspacing="0" cellpadding="0" class="tabForm">
                    <th>
                        <tr>
                            <td height="20px"><b>{$FAX}</b></td>
                        </tr>
                        <tr>
                            <td height="20px"><INPUT type="checkbox" name="backup_fax" id="backup_fax"
                                    onClick="ChequearTabla(this, 'table_fax');"><b>{$TODO_FAX}</b></td>
                        </tr>
                    </th>
                    <tbody>
                        {foreach key=key item=item from=$backup_fax}
                        <tr>
                            <td height="20px"><INPUT type="checkbox" {$item.disable} name="{$key}" id="{$key}"
                                    value="{$key}" onClick="VerificarCheck(this, 'backup_fax');" {$item.check}><span {if
                                    !empty($item.disable)}style="text-decoration: line-through"
                                    {/if}>{$item.desc}&nbsp;{$item.msg}<span></td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>

                <!-- ********** E M A I L ************ -->
                <table id="table_email" width="100%" border="0" cellspacing="0" cellpadding="0" class="tabForm">
                    <th>
                        <tr>
                            <td height="20px"><b>{$EMAIL}</b></td>
                        </tr>
                        <tr>
                            <td height="20px"><INPUT type="checkbox" name="backup_email" id="backup_email"
                                    onClick="ChequearTabla(this, 'table_email');"><b>{$TODO_EMAIL}</b>
                            </td>
                        </tr>
                    </th>
                    <tbody>
                        {foreach key=key item=item from=$backup_asterisk}
                        <tr>
                            <td height="20px"><INPUT type="checkbox" {$item.disable} name="{$key}" id="{$key}"
                                    value="{$key}" onClick="VerificarCheck(this, 'backup_email');" {$item.check}><span
                                    {if !empty($item.disable)}style="text-decoration: line-through"
                                    {/if}>{$item.desc}&nbsp;{$item.msg}</span></td>
                        </tr>
                        {/foreach}
                        <tr>
                            <td height="20px">&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--  -->


            <!-- ///////////////////////////// QUEBRA AQUI ////////////////////////////////////// -->
            <div style="display: grid; grid-template-columns: repeat(3, 1fr); align-items: start;">

                <!-- ********** A S T E R I X ************ -->
                <table id="table_asterisk" width="100%" border="0" cellspacing="0" cellpadding="0" class="tabForm">
                    <th>
                        <tr>
                            <td height="20px"><b>{$ASTERISK}</b></td>
                        </tr>
                        <tr>
                            <td height="20px"><INPUT type="checkbox" name="backup_asterisk" id="backup_asterisk"
                                    onClick="ChequearTabla(this, 'table_asterisk');"><b>{$TODO_ASTERISK}</b>
                            </td>
                        </tr>
                    </th>
                    <tbody>
                        {foreach key=key item=item from=$backup_asterisk}
                        <tr>
                            <td height="20px"><INPUT type="checkbox" {$item.disable} name="{$key}" id="{$key}"
                                    value="{$key}" onClick="VerificarCheck(this, 'backup_asterisk');"
                                    {$item.check}><span {if !empty($item.disable)}style="text-decoration: line-through"
                                    {/if}>{$item.desc}&nbsp;{$item.msg}</span></td>
                        </tr>
                        {/foreach}
                        <tr>
                            <td height="20px">&nbsp;</td>
                        </tr>
                    </tbody>
                </table>

                <!-- ********** O T H E R S ************ -->
                <table id="table_others" width="100%" border="0" cellspacing="0" cellpadding="0" class="tabForm">
                    <th>
                        <tr>
                            <td height="20px"><b>{$OTROS}</b></td>
                        </tr>
                        <tr>
                            <td height="20px"><INPUT type="checkbox" name="backup_others" id="backup_others"
                                    onClick="ChequearTabla(this, 'table_others');"><b>{$TODO_OTROS}</b></td>
                        </tr>
                    </th>
                    <tbody>
                        {foreach key=key item=item from=$backup_otros}
                        <tr>
                            <td height="20px"><INPUT type="checkbox" {$item.disable} name="{$key}" id="{$key}"
                                    value="{$key}" onClick="VerificarCheck(this, 'backup_others');" {$item.check}><span
                                    {if !empty($item.disable)}style="text-decoration: line-through"
                                    {/if}>{$item.desc}&nbsp;{$item.msg}</span></td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>

                <!-- ********** N E W   O T H E R S ************ -->
                <table id="table_others_new" width="100%" border="0" cellspacing="0" cellpadding="0" class="tabForm">
                    <tr>
                        <td height="20px"><b>{$OTROS_NEW}</b></td>
                    </tr>
                    <tr>
                        <td height="20px"><INPUT type="checkbox" name="backup_others_new" id="backup_others_new"
                                onClick="ChequearTabla(this, 'table_others_new');"><b>{$TODO_OTROS_NEW}</b></td>
                    </tr>

                    <tbody>
                        {foreach key=key item=item from=$backup_otros_new}
                        <tr>
                            <td height="20px"><INPUT type="checkbox" {$item.disable} name="{$key}" id="{$key}"
                                    value="{$key}" onClick="VerificarCheck(this, 'backup_others_new');"
                                    {$item.check}><span {if !empty($item.disable)}style="text-decoration: line-through"
                                    {/if}>{$item.desc}&nbsp;{$item.msg}</span></td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>

            <!-- ///////////////////////////// QUEBRA AQUI ////////////////////////////////////// -->
            <div style="display: grid; grid-template-columns: repeat(3, 1fr); align-items: start;">

                <!-- ********** P H O N E V O X ************ -->
                <table id="table_phonevox_customs" width="100%" border="0" cellspacing="0" cellpadding="0" class="tabForm">
                    <tr>
                        <td height="20px"><b>{$PHONEVOX_CUSTOMS}</b></td>
                    </tr>
                    <tr>
                        <td height="20px"><INPUT type="checkbox" name="backup_phonevox_customs"
                                id="backup_phonevox_customs"
                                onClick="ChequearTabla(this, 'table_phonevox_customs');"><b>{$TODO_PHONEVOX_CUSTOMS}</b>
                        </td>
                    </tr>
                    <tbody>
                        {foreach key=key item=item from=$backup_phonevox_customs}
                        <tr>
                            <td height="20px"><INPUT type="checkbox" {$item.disable} name="{$key}" id="{$key}"
                                    value="{$key}" onClick="VerificarCheck(this, 'backup_phonevox_customs');"
                                    {$item.check}><span {if !empty($item.disable)}style="text-decoration: line-through"
                                    {/if}>{$item.desc}&nbsp;{$item.msg}</span></td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>

                <!-- ********** OPÇÃO NOVA ************ -->
                <!-- <table id="table_phonevox_customs" width="100%" border="0" cellspacing="0" cellpadding="0" class="tabForm">
                    <tr>
                        <td height="20px"><b>{$PHONEVOX_CUSTOMS}</b></td>
                    </tr>
                    <tr>
                        <td height="20px"><INPUT type="checkbox" name="backup_phonevox_customs"
                                id="backup_phonevox_customs"
                                onClick="ChequearTabla(this, 'table_phonevox_customs');"><b>{$TODO_PHONEVOX_CUSTOMS}</b>
                        </td>
                    </tr>
                    <tbody>
                        {foreach key=key item=item from=$backup_phonevox_customs}
                        <tr>
                            <td height="20px"><INPUT type="checkbox" {$item.disable} name="{$key}" id="{$key}"
                                    value="{$key}" onClick="VerificarCheck(this, 'backup_phonevox_customs');"
                                    {$item.check}><span {if !empty($item.disable)}style="text-decoration: line-through"
                                    {/if}>{$item.desc}&nbsp;{$item.msg}</span></td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table> -->

                <!-- ********** OPÇÃO NOVA ************ -->
                <!-- <table id="table_phonevox_customs" width="100%" border="0" cellspacing="0" cellpadding="0" class="tabForm">
                    <tr>
                        <td height="20px"><b>{$PHONEVOX_CUSTOMS}</b></td>
                    </tr>
                    <tr>
                        <td height="20px"><INPUT type="checkbox" name="backup_phonevox_customs"
                                id="backup_phonevox_customs"
                                onClick="ChequearTabla(this, 'table_phonevox_customs');"><b>{$TODO_PHONEVOX_CUSTOMS}</b>
                        </td>
                    </tr>
                    <tbody>
                        {foreach key=key item=item from=$backup_phonevox_customs}
                        <tr>
                            <td height="20px"><INPUT type="checkbox" {$item.disable} name="{$key}" id="{$key}"
                                    value="{$key}" onClick="VerificarCheck(this, 'backup_phonevox_customs');"
                                    {$item.check}><span {if !empty($item.disable)}style="text-decoration: line-through"
                                    {/if}>{$item.desc}&nbsp;{$item.msg}</span></td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table> -->

            </div>

            <!-- Caso queira adicionar mais uma linha só adaptar essas linhas abaixo -->
            <!-- <div style="display: grid; grid-template-columns: repeat(3, 1fr); align-items: start;">
                < TABELA AQUI >
                < TABELA AQUI >
                < TABELA AQUI >  
            </div> -->
            <!--  -->

        </div>
    </div>

    <INPUT type="hidden" name="option_url" id="option_url" value="{$OPTION_URL}">
    <input type='hidden' name='backup_file' value='{$BACKUP_FILE}'></td>
</form>