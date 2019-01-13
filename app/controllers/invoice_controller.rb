class InvoiceController < ApplicationController
  def index
  end

	def parse_invoice
		File.delete("number_in_decimal.txt") if File.exist?("number_in_decimal.txt")
  	if !params[:file].present?
  		puts "blank"
  		flash[:alert] = "Please Upload a file for conversion."
  		redirect_to root_path
  	end
  	@segment_number = [[" _ ", "| |", "|_|"],["   ","  |","  |"],[" _ ", " _|", "|_ "],[" _ ", " _|", " _|"],["   ","|_|", "  |"],[" _ ", "|_ ", " _|"],[" _ ", "|_ ", "|_|"],[" _ ", "  |", "  |"],[" _ ", "|_|", "|_|"],[" _ ", "|_|", " _|"]]
  	@decimal_number_list =[]
  	arr_seg_number = []
  	line_remove = 4 
  	File.open(params[:file].path).each_with_index do |line,i| 
    	arr_seg_number << line if not (i+1) % line_remove == 0
  	end
  	arr_seg_number_with_group_of_three_element = arr_seg_number.each_slice(3).to_a
  	arr_seg_number_with_group_of_three_element.each do |element|
      conversion(element)
  	end
  	@decimal_number_list.each_slice(9).to_a.each do |list|
  		File.open("number_in_decimal.txt", "a") do |f|
  			f.write(list.join()) 
  			f.write("\n")
  		end 
		end
		send_file(File.open('number_in_decimal.txt').path , :filename => 'number_in_decimal')
  end

  def conversion(element)
	    element[0] = element[0] if element[0].size == 1
	    element[1] = element[1] if element[1].size == 1
	    element[2] = element[2] if element[2].size == 1
    9.times.map do |t|
  		begin
	      line1 = element[0].delete("\n").split('').each_slice(3).to_a[t] 
	      line2 = element[1].delete("\n").split('').each_slice(3).to_a[t] 
	      line3 = element[2].delete("\n").split('').each_slice(3).to_a[t] 
	      list = []
	      list << line1.join() << line2.join() << line3.join()
	      @decimal_number_list << @segment_number.each_index.select{|i| @segment_number[i] == list}[0]
	     rescue
		  	flash[:alert] = "File data format is not correct"
	  	end
    end
  end

end
