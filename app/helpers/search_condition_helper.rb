#coding: utf-8
module SearchConditionHelper
  
  #是否已经检索过一次
  def is_second_search?
    
    return session[:flag_search_in_result]
    
#    if session[:last_search_sql_statement]!=nil && session[:last_search_sql_statement]!=""
#      
#      RAILS_DEFAULT_LOGGER.error("..."+session[:last_search_sql_statement]+"....")
#      
#      return true
#    else
#      return false
#    end
  end

  def format_search_word(search_word)
    #%{检索条件：#{search_word.gsub('+', '<font color=red>+</font>')}} unless search_word.blank?
    %{检索条件：<font color=red>#{search_word}</font>}.html_safe unless search_word.blank?
  end

  def check(statistic_type,value)
    if statistic_type== value
      true
    else
      false
    end
  end

  def isDisplay(statistic_type,value)
     if statistic_type == value
       "block"
     else
       "none"
     end
  end
  
end
 
