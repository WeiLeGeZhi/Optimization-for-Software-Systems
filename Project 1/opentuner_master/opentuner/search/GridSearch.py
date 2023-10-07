from opentuner.search import technique
from functools import cmp_to_key
import sys

class GridSearch(technique.SequentialSearchTechnique):
  def main_generator(self):

    objective   = self.objective
    driver      = self.driver
    manipulator = self.manipulator
    # start at start point
    startpoint={'BLOCK_SIZE': 8, 'cmpl_opt': 0}
    current = driver.get_configuration(startpoint)
    yield current
    best_opt = driver.get_configuration(startpoint)
    yield best_opt

    while True:
      points = list()
      for param in manipulator.parameters(current.data):
        if param.is_primitive():
          print("current running:",current.data)
          if int(current.data['BLOCK_SIZE'])<128:
            next_para = manipulator.copy(current.data)
            next_BLOCK_SIZE=int(next_para['BLOCK_SIZE'])*2
            next_para['BLOCK_SIZE']=str(next_BLOCK_SIZE)
            next_to_run = driver.get_configuration(next_para)
            yield next_to_run
            points.append(next_to_run)
          elif int(current.data['cmpl_opt'])<3:
            next_para = manipulator.copy(current.data)
            next_cmpl_opt=int(next_para['cmpl_opt'])+1
            next_para['cmpl_opt']=str(next_cmpl_opt)
            next_para['BLOCK_SIZE']=str(8)
            next_to_run = driver.get_configuration(next_para)
            yield next_to_run
            points.append(next_to_run)
          else:
            points.append(current)
            sys.exit()

      #sort points
      points.sort(key=cmp_to_key(objective.compare))

      current = points[0]
      if objective.lt(points[0], best_opt):
        best_opt = points[0]

# register our new technique in global list
technique.register(GridSearch())