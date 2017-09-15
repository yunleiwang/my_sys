function showSub(obj,name){
    //alert(1)
    //console.log(name)
    //console.log(obj.type)

    var index = "";
    if(obj.type == 'select-one'){
        index = $(obj).find("option:selected").attr('index');
        $('.'+name+'[index='+index+']').css('display','block');
    }else{
        index = $(obj).attr('index');
        $('.'+name).hide();
        $('.'+name+'[index='+index+']').css('display','block');
    }

    if(obj.type == 'checkbox'){
        if($(obj).is(':checked')){
            $('.'+name+'[index='+index+']').css('display','block');
        }else{
            $('.'+name+'[index='+index+']').hide();
            //$('.item_children:hidden :input').val('').removeAttr('checked').removeAttr('selected');
        }
    }
    //else{
    //    $('.'+name).hide();
    //    $('.'+name+'[index='+index+']').css('display','block');
    //}
    if(obj.type == 'radio'){
        if($(obj).is(':checked')){
            $('.'+name).hide();
            $('.'+name+'[index='+index+']').css('display','block');
        }else{
            $('.'+name+'[index='+index+']').hide();
            //$('.item_children:hidden :input').val('').removeAttr('checked').removeAttr('selected');
        }
    }

}
//
function allNo(table_id){
    $("#"+table_id).find(":radio[value='无']").click();
}

function allYes(table_id){
    var a = $("#"+table_id).find(":radio[value='有']").attr("checked",true).trigger("change");
}

function delete_img(item_id,pat_image_after_id){
    Array.prototype.remove_index=function(dx){
        if(isNaN(dx)||dx>this.length){return false;}
        for(var i=0,n=0;i<this.length;i++){
            if(this[i]!=this[dx]){
                this[n++]=this[i]
            }
        }
        this.length-=1
    }
    var images=$("#name_"+item_id).val().split(',')
    $.ajax({
        type: 'GET',
        url: '/pat_image_afters/1/delete1',
        data: "pat_image_after_id="+pat_image_after_id,
        success: function(msg) {
           if(msg=="ok"){
               $("#image_li_"+pat_image_after_id).remove();
               var index = -1;
               for(var i=0;i<images.length;i++){
                   if(images[i]==pat_image_after_id){
                       index = i;
                   }
               }
               images.remove_index(index)
               $("#name_"+item_id).val(images.join(','));
           }
        }
    });

}
//function radio_click(obj,name,n){
//    var i = n;
//    var val = setTimeout(call(obj,name,i),250);
//    if(n==2){
//        clearTimeout(val);
//    }
//
//}
//
//function call(obj,name,i){
//    if(i==1){
//        showSub(obj,name);
//    }else if(i==2){
//        dbclickcancel(obj,name);
//    }
//}

function dbclickcancel(id,name){
    $("#"+id).attr("checked",false)
    $('.'+name).hide();
}

// group add
function addGroup(tableId){
    var groupId = tableId.split("_")[2]
    var group_num =  document.getElementById("group_num"+groupId).value;
    //var group_num =  1;
    $.ajax({
        type: 'GET',
        url: '/item_groups/'+groupId+'/add_item_group',
        data: "groupId="+groupId+"&&num="+group_num+"&&tableId="+tableId,
        success: function(msg) {

        }
    });
    document.getElementById("group_num"+groupId).value = Number(group_num)+1;
}
function delGroup(divId)
{
    if($("#"+divId + ">div").size()>1){
        $("#"+divId + " >div:last-child").remove()
    }

}

