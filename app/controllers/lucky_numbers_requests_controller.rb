require 'net/http'
require 'uri'

class LuckyNumbersRequestsController < ApplicationController
  def input
  end

  def view
    # формируем запрос из строки с адресом
    uri = URI.parse('http://localhost:3000/lucky_numbers/view.xml')

    # Добавляем параметры к адресу
    uri.query = URI.encode_www_form({ numbers_count: params[:numbers_count], response_type: params[:response_type]})

    # Создаем объект запроса
    request = Net::HTTP::Get.new(uri)

    # Отправляем запрос
    @response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(request)
    end

    @doc = Nokogiri::XML(@response.body) # формируем xml документ ответа с помощью nokogiri

    respond_to do |format|
      format.html { render inline: render_html }
      format.xml { render xml: render_xml }
    end
  end

  private

  def render_html
    xslt = Nokogiri::XSLT(File.read('public\view.xslt'))
    @doc = xslt.transform(@doc)
    File.write('app/views/controller_response/doc.html', @doc) # отладочное сохранение полученного html документа
    @doc
  end

  def render_xml
    @doc.root.add_previous_sibling(Nokogiri::XML::ProcessingInstruction.new(@doc, 'xml-stylesheet', 'type="text/xsl" href="/view.xslt"'))
    File.write('app/views/controller_response/doc.xml', @doc) # отладочное сохранение полученного xml документа
    @doc
  end
end
