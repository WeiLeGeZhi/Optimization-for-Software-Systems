#Optimization-for-Software-Systems P1 autotuner
from __future__ import print_function

import opentuner
from opentuner import ConfigurationManipulator
from opentuner import IntegerParameter,EnumParameter
from opentuner import MeasurementInterface
from opentuner import Result


class GccFlagsTuner(MeasurementInterface):

    def manipulator(self):
        """
        Define the search space by creating a
        ConfigurationManipulator
        """
        manipulator = ConfigurationManipulator()
        manipulator.add_parameter(
            IntegerParameter('cmpl_opt', 0, 3))
        manipulator.add_parameter(
            EnumParameter('BLOCK_SIZE', [8, 16, 32, 64, 128]))
        return manipulator

    def run(self, desired_result, input, limit):
        """
        Compile and run a given configuration then
        return performance
        """
        cfg = desired_result.configuration.data

        gcc_cmd = 'gcc multimatri.c '
        gcc_cmd += ' -D{0}={1}'.format('BLOCK_SIZE', cfg['BLOCK_SIZE'])
        gcc_cmd += ' -O{0}'.format(cfg['cmpl_opt'])
        gcc_cmd += ' -o ./tmp.bin'

        compile_result = self.call_program(gcc_cmd)

        run_cmd = './tmp.bin'

        run_result = self.call_program(run_cmd)

        return Result(time=run_result['time'])

    def save_final_config(self, configuration):
        """called at the end of tuning"""
        print("Optimal block size written to mmm_final_config.json:", configuration.data)
        self.manipulator().save_to_file(configuration.data,
                                        'mmm_final_config.json')


if __name__ == '__main__':
    argparser = opentuner.default_argparser()
    GccFlagsTuner.main(argparser.parse_args())
