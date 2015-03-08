module.exports = (grunt) ->

  grunt.initConfig
    meta:
      src: 'src/**/*.js'
      specs: 'spec/**/*.js'

    watch:
        files: '**/*.coffee'
        tasks: ['test']

    jasmine:
      src: '<%= meta.src %>'
      options:
        specs: '<%= meta.specs %>'
        vendor: ''

    coffee:
      compile:
        files:
          'src/enigma.js': ['src/*.coffee']
          'spec/enigma_spec.js': ['spec/*.coffee']

  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-jasmine')


  grunt.registerTask('test', ['coffee', 'jasmine'])
  grunt.registerTask('default', ['test'])
