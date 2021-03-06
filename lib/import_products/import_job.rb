module ImportProducts
  class ImportJob
    attr_accessor :product_import_id
    attr_accessor :user_id

    def initialize(product_import_record, user)
      self.product_import_id = product_import_record.id
      self.user_id = user.id
    end

    def perform
      begin
        product_import = ProductImport.find(self.product_import_id)
        results = product_import.import_data!
        UserMailer.product_import_results(User.find(self.user_id)).deliver
      rescue Exception => exp
        UserMailer.product_import_results(User.find(self.user_id), exp.message).deliver
      end
    end
  end
end

