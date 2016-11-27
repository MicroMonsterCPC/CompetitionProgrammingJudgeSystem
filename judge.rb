class JudgeSystem
  def initialize(user_name, language, question_id)
    @lang              = language
    @user_name         = user_name
    @question_id       = question_id
    @input_answer_path = nil
    @answer            = nil
    @input_path        = nil
  end
  attr_accessor :lang, :user_name, :question_id, :input_anwer_path, :ansewr_path, :input_path

  def main
    code_path
    result = code_run
    puts (result ? "CLEAR！" : "BAD")
  end

  def code_path
    File.open("./code/#{@user_name}.#{@lang}", "r") do |file|
      @input_answer_path =  file.path 
    end
    File.open("./QuestionCases/#{@question_id}/answer/case_1_answer.txt", "r") do |file|
      @answer = file.read
    end
    i = 1
    @input_path  = "./QuestionCases/#{@question_id}/input/case_#{i}.txt"
  end

  def code_run
    case @lang
    when "rb"
      result = %x( ruby #{@input_answer_path} < #{@input_path} ) 
      return result == @answer
    when "cr"
      puts %x( crystal #{file.path}  )
    end
  end
end
