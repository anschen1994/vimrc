def Settings( **kwargs ):
  return {
    # should stay consistent with run c++ code command in my_configs.vim
    'flags': [ '-x', 'c++', '-Wall', '-std=c++11'],
  }
