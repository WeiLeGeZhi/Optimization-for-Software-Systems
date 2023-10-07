from opentuner.search import technique
from functools import cmp_to_key
import sys

# Function to find the best BLOCK_SIZE based on objective values
def find_best_block_size(configs, objective):
    best_block_size = None
    best_score = float('inf')  # Initialize with a large value
    for config in configs:
        if objective.lt(config, best_block_size):
            best_block_size = int(config.data['BLOCK_SIZE'])
            best_score = config.score
    return best_block_size

class OneFactorAtATime(technique.SequentialSearchTechnique):
    def main_generator(self):

        objective = self.objective
        driver = self.driver
        manipulator = self.manipulator
        # start at start point
        startpoint = {'BLOCK_SIZE': 8, 'cmpl_opt': 0}
        current = driver.get_configuration(startpoint)
        yield current
        best_opt = driver.get_configuration(startpoint)
        yield best_opt

        best_block_size = None  # Initialize best_block_size
        block_sizes_tested = set()

        while True:
            points0 = list()
            if int(current.data['BLOCK_SIZE'])>=128:
                break;
            for param in manipulator.parameters(current.data):
                if param.is_primitive():
                    print("current running:", current.data)
                    current_block_size = int(current.data['BLOCK_SIZE'])
                    if current_block_size not in block_sizes_tested:
                            block_sizes_tested.add(current_block_size)
                            next_para = manipulator.copy(current.data)
                            next_BLOCK_SIZE = current_block_size * 2
                            next_para['BLOCK_SIZE'] = str(next_BLOCK_SIZE)
                            next_to_run = driver.get_configuration(next_para)
                            yield next_to_run
                            points0.append(next_to_run)
                    else:
                        print("Block size already tested:", current_block_size)
                        points0.append(current)

            # sort points
            points0.sort(key=cmp_to_key(objective.compare))
            current = points0[0]
            if objective.lt(points0[0], best_opt):
                best_opt = points0[0]


            # Check if all block sizes have been tested
            # if len(block_sizes_tested) == 5:
            #     best_block_size = find_best_block_size(points, objective)
            #     break
        # Now start the second loop with the best_block_size fixed
        best_block_size = best_opt.data['BLOCK_SIZE']
        startpoint = {'BLOCK_SIZE': best_block_size, 'cmpl_opt': 0}
        current = driver.get_configuration(startpoint)
        yield current

        while True:
            points = list()
            for param in manipulator.parameters(current.data):
                if param.is_primitive():
                    print("current running:", current.data)
                    if int(current.data['cmpl_opt']) < 3:
                        next_para = manipulator.copy(current.data)
                        next_cmpl_opt = int(next_para['cmpl_opt']) + 1
                        next_para['cmpl_opt'] = next_cmpl_opt
                        next_para['BLOCK_SIZE'] = best_block_size  # Fix BLOCK_SIZE
                        next_to_run = driver.get_configuration(next_para)
                        yield next_to_run
                        points.append(next_to_run)
                    else:
                        points.append(current)
                        sys.exit()

            # sort points
            points.sort(key=cmp_to_key(objective.compare))

            current = points[0]
            if objective.lt(points[0], best_opt):
                best_opt = points[0]

# Register our new technique in global list
technique.register(OneFactorAtATime())