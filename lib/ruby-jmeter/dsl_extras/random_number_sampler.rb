RANDOM_VARIABLE_SCRIPT = <<RANDOM_NUMBER_VARIABLE
import java.util.Random;

String[] categories = (vars.get("_for_random_value_")).split(",");

int idx = new Random().nextInt(categories.length);
String category = (categories[idx]);

vars.put("final_var_name", category);
RANDOM_NUMBER_VARIABLE

module RubyJmeter
  class DSL
    def random_number_sampler(params)
      variables(name: '_for_random_value_', value: params[:variable_values])
      beanshell_sampler({'query' =>  RANDOM_VARIABLE_SCRIPT.gsub('final_var_name', params[:final_variable])})
    end
  end
end
