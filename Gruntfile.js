module.exports = function (grunt) {
    grunt.file.expand('../node_modules/grunt-*/tasks').forEach(grunt.loadTasks);
    require('load-grunt-tasks')(grunt);
    grunt.loadNpmTasks('grunt-contrib-clean');
    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        clean: {
            build: {
                src: ['client/server/dist']
            }
        },
        express: {
            server: {
                options: {
                    script: 'server/server.js'
                }
            }
        },
        watch: {
            options: {
                livereload: true
            },
            express: {
                files: [
                    'server/**/*.js',
                    'common/**/*.js',
                    'server/**/*.json',
                    'common/**/*.json',
                    'Gruntfile.js'
                ],
                tasks: ['express:server'],
                options: {
                    spawn: false
                }
            }
        },
        uglify: {
            options: {
                sourceMap: true,
                beautify: true,
                banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
                    '<%= grunt.template.today("yyyy-mm-dd") %> */'
            }
        }
    });

    // Load the plugin that provides the "uglify" task.
    grunt.loadNpmTasks('grunt-contrib-uglify');

    grunt.registerTask('build', [
        'clean',
        'express:server',
        'watch'
    ]);

    grunt.registerTask('docker', [
        'build'
    ]);
    // Default task(s).
    grunt.registerTask('default', ['uglify']);
};