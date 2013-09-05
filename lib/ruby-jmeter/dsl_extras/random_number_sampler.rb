RANDOM_VARIABLE_SCRIPT = <<RANDOM_NUMBER_VARIABLE
import java.util.Random;

String[] categories = (vars.get("search_terms")).split(",");

int idx = new Random().nextInt(categories.length);
String category = (categories[idx]);

vars.put("search_term", category);
RANDOM_NUMBER_VARIABLE

module RubyJmeter
  class DSL
    def random_number_sampler(params)
      variables(name: params[:variable], value: params[:variable_values])
      beanshell_sampler({'query' =>  RANDOM_VARIABLE_SCRIPT.gsub('final_var_name', params[:final_variable])})
    end
  end
end
