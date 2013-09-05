class SimpleAssertionFailedAnalyzer
  def self.analyze(log_file, logger)
    doc = create_doc(log_file)
    errors = doc.css('assertionResult failureMessage')
    errors.each do |error|
      logger.error(error.text)
    end
    (logger.error("#{errors.size} Errors encountered ") and return 'error') if errors && errors.any?
  end

  private

  def self.create_doc(log_file)
    Nokogiri::XML(File.open(log_file))
  end
end