desc 'Rubocop'
task :rubocop do
  avaliar_code
end

def avaliar_code
  puts 'Analisando código-fonte com o Rubocop..............'
  checklist = '-r rubocop/formatter/checkstyle_formatter'
  config = '-c code_analyzer/configs.yml'
  formatter = '-f RuboCop::Formatter::CheckstyleFormatter'
  output = '-o code_analyzer/checkstyle-result.xml -f html -o code_analyzer/index.html'
  system "rubocop #{checklist} #{config} #{formatter} #{output} -P"
  puts 'Análise concluída!'
end
