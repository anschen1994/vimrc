def Settings(**kwargs):
    client_data = kwargs['client_data']
    return {
        # should stay consistent with run c++ code command in my_configs.vim
        'flags': ['-x', 'c++', '-Wall', '-std=c++11'],
        # specify the adopted python interpreter
        'interpreter_path': client_data['g:ycm_python_interpreter_path'],
        }
