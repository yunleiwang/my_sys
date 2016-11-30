module ItemFormMetaelementsHelper
  def item_display(item, value = nil, options = {})
    if item.response_type=="text"
      item_text_field_tag(item, value, options)
    elsif item.response_type=="radio"
      item_radio_button_tag2(item, value, checked = false, options)
    elsif item.response_type=="single-select"
      item_select_tag(item, option_tags = nil, options)
    elsif item.response_type=="checkbox"
      item_check_box_tag2(item, value, checked = false, options)
    elsif item.response_type=="multi-select"
      item_multi_select_tag(item, option_tags = nil, options)
    end
  end
  # content_tag 用法如下
  # content_tag :div, :class => "container" do
  #   content_tag(:h2, "This is title") +
  #       content_tag(:p, "This is content") +
  #       "Footer"
  # end


  # text的html用法
  # <div class="form-group">
  #      <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Text Field </label>
  #
  #         <div class="col-sm-9">
  #           <input type="text" id="form-field-1" placeholder="Username" class="col-xs-10 col-sm-5" />
  #         </div>
  # </div>
  def item_text_field_tag(item, value = nil, options = {})
    text_field_tag "item_#{item.id}", value, :class=>"col-xs-10 col-sm-5"
  end

  # item_radio_button_tag 的html例子如下
  # <div class="form-group">
  #     <label class="col-sm-3 control-label no-padding-right">Radio</label>
  #     <div class="col-sm-9">
  #       <div class="radio">
  #         <label>
  #           <input name="form-field-radio" type="radio" class="ace" />
  #           <span class="lbl"> radio option 1</span>
  #         </label>
  #       </div>
  #
  #       <div class="radio">
  #         <label>
  #           <input name="form-field-radio" type="radio" class="ace" />
  #           <span class="lbl"> radio option 2</span>
  #         </label>
  #       </div>
  #     </div>
  # </div>
  def item_radio_button_tag(item, value=nil, checked = false, options = {})
    arr_options_text = item.options_text.split(',')
    if arr_options_text.empty?
      arr_options_text = item.options_text.split('，')
    end
    arr_options_value = item.options_value.split(',')
    if arr_options_value.empty?
      arr_options_value = item.options_value.split('，')
    end

    radio_html = ""
    arr_options_text.each_with_index do |option_text, index|
      radio_html << (content_tag :div, :class=>"radio" do
        content_tag :label do
          options[:index] = index
          options[:id] = "item_#{item.id}_#{index}"
          options[:value]=arr_options_value[index]
          options[:ondblclick] = "dbclickcancel(this,'#{item.name}')"
          options[:onchange] = "showSub(this,'#{item.name}')"
          options[:class]="ace"
          concat radio_button_tag "item_#{item.id}", arr_options_value[index], checked, options
          concat content_tag :span, option_text, :class=>"lbl"
        end
        # radio_html << %{
        #   <script>
					# 	$(function(){
					# 		$("#item_#{item.id}_#{index}").trigger("change");
					# 	});
					# </script>
        # }
      end)
    end

    radio_html.html_safe
  end

  def item_radio_button_tag2(item, value=nil, checked = false, options = {})
    arr_options_text = item.options_text.split(',')
    if arr_options_text.empty?
      arr_options_text = item.options_text.split('，')
    end
    arr_options_value = item.options_value.split(',')
    if arr_options_value.empty?
      arr_options_value = item.options_value.split('，')
    end

    radio_html = ""
    arr_options_text.each_with_index do |option_text, index|
      radio_html<<(
        content_tag :label, :ondblclick => "dbclickcancel('item_#{item.id}_#{index}','#{item.name}')" do
          options[:index] = index
          options[:id] = "item_#{item.id}_#{index}"
          options[:value]=arr_options_value[index]
          options[:onchange] = "showSub(this,'#{item.name}')"
          options[:class]="ace"
          concat radio_button_tag "item_#{item.id}", arr_options_value[index], checked, options
          concat content_tag :span, option_text, :class=>"lbl"
          concat "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp".html_safe;
        end)

      # radio_html << %{
      #     <script>
				# 		$(function(){
				# 			$("#item_#{item.id}_#{index}").trigger("change");
				# 		});
				# 	</script>
      #   }

    end
    content_tag :div, :class=>"radio" do
      radio_html.html_safe
    end

  end

  # item_select_tag 的html例子如下
  # <div class="form-group">
  #    <label class="col-sm-3 control-label no-padding-right" for="form-field-select-3">Chosen</label>
  #     <div class="col-sm-5">
  #       <select class="width-75 chosen-select" id="form-field-select-3" data-placeholder="Choose a Country...">
  #         <option value="">&nbsp;</option>
  #         <option value="AL">Alabama</option>
  #         <option value="AK">Alaska</option>
  #         <option value="AZ">Arizona</option>
  #         <option value="AR">Arkansas</option>
  #         <option value="CA">California</option>
  #         <option value="CO">Colorado</option>
  #         <option value="WY">Wyoming</option>
  #       </select>
  #     </div>
  # </div>

  def item_select_tag(item, option_tags = nil, options = {})
    option_texts = item.options_text.split(',')
    if option_texts.empty?
      option_texts = item.options_text.split('，')
    end
    option_values = item.options_value.split(',')
    if option_values.empty?
      option_values = item.options_value.split('，')
    end
    arr = []
    select_tags= ""
    option_texts.each_with_index do |option_text,index|
      arr<<[option_text,option_values[index], :index=>index]
      # select_tags<< %{
      #     <script>
				# 		$(function(){
				# 			$("#item_#{item.id}_#{index}").trigger("change");
				# 		});
				# 	</script>
      #   }
    end

    options[:onchange] = "showSub(this,'#{item.name}')"
    options[:prompt] = item.default_value
    options[:class] = "width-40 chosen-select"
    #options[:class] = "width-40 chosen-select col-xs-10 col-sm-5"

    select_tag("item_#{item.id}", options_for_select(arr, options[:value]), options)


  end

  # item_multi_select_tag 的html例子如下
  # <div class="form-group">
  #    <label class="col-sm-3 control-label no-padding-right" for="form-field-select-3">Chosen</label>
  #     <div class="col-sm-5">
  #       <select class="width-75 chosen-select" id="form-field-select-3" data-placeholder="Choose a Country...">
  #         <option value="">&nbsp;</option>
  #         <option value="AL">Alabama</option>
  #         <option value="AK">Alaska</option>
  #         <option value="AZ">Arizona</option>
  #         <option value="AR">Arkansas</option>
  #         <option value="CA">California</option>
  #         <option value="CO">Colorado</option>
  #         <option value="WY">Wyoming</option>
  #       </select>
  #     </div>
  # </div>

  def item_multi_select_tag(item, option_tags = nil, options = {})
    option_texts = item.options_text.split(',')
    if option_texts.empty?
      option_texts = item.options_text.split('，')
    end
    option_values = item.options_value.split(',')
    if option_values.empty?
      option_values = item.options_value.split('，')
    end
    arr = []
    option_texts.each_with_index do |option_text,index|
      arr<<[option_text,option_values[index], :index=>index]
    end

    options[:onchange] = "showSub(this,'#{item.name}')"
    options[:prompt] = item.default_value
    options[:class] = "width-40 chosen-select"
    options[:multiple] = true
    #options[:class] = "width-40 chosen-select col-xs-10 col-sm-5"
    arr_value = options[:value].nil? ? [] : options[:value].split(',')
    select_tag("item_#{item.id}", options_for_select(arr, arr_value), options)
  end

  # item_check_box_tag 的html例子如下
  # <div class="checkbox">
  #    <label>
  #      <input name="form-field-checkbox" type="checkbox" class="ace ace-checkbox-2" />
  #      <span class="lbl"> choice 2</span>
  #    </label>
  # </div>

  def item_check_box_tag(item, value = nil, checked = false, options = {})
    arr_options_text = item.options_text.split(',')
    if arr_options_text.empty?
      arr_options_text = item.options_text.split('，')
    end
    arr_options_value = item.options_value.split(',')
    if arr_options_value.empty?
      arr_options_value = item.options_value.split('，')
    end

    my_input_html = ""
    arr_options_text.each_with_index do |option_text, index| #循环选项
      my_input_html << (content_tag(:div, :class=>"checkbox") do
        content_tag :label do
          options[:index] = index
          options[:id] = "item_#{item.id}_#{index}"
          options[:value] = arr_options_value[index]
          options[:onchange] = "showSub(this,'#{item.name}')"
          options[:class] = "ace ace-checkbox-2"
          concat check_box_tag("item_#{item.id}[]", value, checked, options)
          concat (content_tag :span, option_text, :class=>"lbl")
        end
        # my_input_html << %{
        #   <script>
					# 	$(function(){
					# 		$("#item_#{item.id}_#{index}").trigger("change");
					# 	});
					# </script>
        # }
      end)

    end
    my_input_html.html_safe
  end

  def item_check_box_tag2(item, value = nil, checked = false, options = {})
    arr_options_text = item.options_text.split(',')
    if arr_options_text.empty?
      arr_options_text = item.options_text.split('，')
    end
    arr_options_value = item.options_value.split(',')
    if arr_options_value.empty?
      arr_options_value = item.options_value.split('，')
    end

    opts = ""
    arr_options_text.each_with_index do |option_text, index| #循环选项
      opts<<(content_tag :label do
              options[:index] = index
              options[:id] = "item_#{item.id}_#{index}"
              options[:value] = arr_options_value[index]
              options[:onchange] = "showSub(this,'#{item.name}')"
              options[:class] = "ace ace-checkbox-2"
              concat check_box_tag("item_#{item.id}[]", value, checked, options)
              concat (content_tag :span, option_text, :class=>"lbl")
          end)
      opts<< "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
      # opts << %{
      #     <script>
				# 		$(function(){
				# 			$("#item_#{item.id}_#{index}").trigger("change");
				# 		});
				# 	</script>
      #   }
    end

    content_tag(:div, :class=>"checkbox") do
      opts.html_safe
    end
    #my_input_html.html_safe
  end

  # content_tag(:div, class: "form-group #{'has-error' if !object.errors[attribute].empty?}") do
  #   label_html = label(attribute, label_text, class: "control-label")
  #
  #   input_html = content_tag(:div, class: "input-group") do
  #     concat super(attribute, options)
  #     concat content_tag(:span, "", class: "input-group-addon glyphicon glyphicon-user")
  #   end
  #
  #   error_html = errors_for_field(attribute)
  #
  #   label_html.html_safe + input_html + error_html
  # end
end
