from opentuner.search import technique
from functools import cmp_to_key
import sys

class GridSearch(technique.SequentialSearchTechnique):
    def main_generator(self):
        objective = self.objective
        driver = self.driver
        manipulator = self.manipulator

        # Define the parameter value ranges
        cmpl_opt_values = [0, 1, 2, 3]
        block_size_values = [8, 16, 32, 64, 128]

        # Iterate through all parameter combinations
        for cmpl_opt in cmpl_opt_values:
            for block_size in block_size_values:
                config_data = {
                    'cmpl_opt': cmpl_opt,
                    'BLOCK_SIZE': block_size
                }
                config = driver.get_configuration(config_data)
                yield config

        # Signal the end of the search
        sys.exit()

# Register the GridSearch technique
technique.register(GridSearch())


