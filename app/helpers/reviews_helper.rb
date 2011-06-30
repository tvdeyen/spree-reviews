module ReviewsHelper
  
  def star(the_class) 
    "<span class=\"#{the_class}\"> &nbsp; </span>"
  end
  
  def mk_stars(m)
    (1..5).collect {|n| n <= m ? star("lit") : star("unlit") }.join
  end
  
end
