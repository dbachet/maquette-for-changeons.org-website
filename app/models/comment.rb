    class Comment < ActiveRecord::Base
      # before_validation :set_write_as_guest
      
      belongs_to :user
      
      # validates :title
      # validates :content, presence => true
      validates_presence_of :content
      validates_presence_of :guest_email, :guest_website, :if => :write_as_guest?

      private
      
      def write_as_guest?
        self.write_as_guest
      end
      # 
      # def set_write_as_guest
      #   if user_signed_in?
      #     self.write_as_guest = false
      #   else
      #     self.write_as_guest = true
      #   end
      # end
      
      # def current_user(current_user)
      #     current_user
      # end
      
    end
