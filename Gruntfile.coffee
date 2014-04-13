module.exports = (grunt) ->
  # 项目配置
  grunt.initConfig
    # 获取项目信息对象
    pkg: grunt.file.readJSON('package.json'),
    # 设计师
    less:
      compile:
        expand: true,
        cwd: 'src/less',
        src: '*.less',
        dest: 'dest/css'
        ext: '.css'
    # 简化
    cssmin:
      compile:
        expand: true,
        cwd: 'dest/css',
        src: '*.css',
        dest: 'dest/css/min'
        ext: '.min.css'
    # 工程师
    coffee:
      compile:
        expand: true,
        cwd: 'src/coffee',
        src: '*.coffee',
        dest: 'dest/js',
        ext: '.js',
        options:
          bare: true,
          join: true,
          sourceMap: true
    # 效率
    uglify:
      compile:
        expand: true,
        cwd: 'dest/js',
        src: '*.js',
        dest: 'dest/js/min',
        ext: '.min.js',
        options:
          banner: '\/\/ create by <%=pkg.author%> in <%=grunt.template.today("yyyy-mm-dd")%> \n'
    # 动态
    watch:
      script:
        files: ['src/less/*.less', 'src/coffee/*.coffee']
        tasks: ['less', 'coffee']
        options:
          livereload: true

  # 从 node_modules 目录加载模块
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  # 定义默认任务
  grunt.registerTask 'default', ['watch']

  # 定义具体的任务
  grunt.registerTask 'coming', ['less', 'cssmin', 'coffee', 'uglify']