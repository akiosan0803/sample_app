# app/controllers/active_storage/direct_uploads_controller.rb
# frozen_string_literal: true

# original: https://github.com/rails/rails/blob/master/activestorage/app/controllers/active_storage/direct_uploads_controller.rb
class ActiveStorage::DirectUploadsController <  ActiveStorage::BaseController
  ActiveStorage::Blob.unattached.find_each(&:purge_later)
  before_action :authenticate_user!
  before_action :check_file_size!

  def create
    blob = ActiveStorage::Blob.create_before_direct_upload!(blob_args)
    render json: direct_upload_json(blob)
  end

  private
    def blob_args
      params.require(:blob).permit(:filename, :byte_size, :checksum, :content_type, :metadata).to_h.symbolize_keys
    end

    def direct_upload_json(blob)
      blob.as_json(root: false, methods: :signed_id).merge(direct_upload: {
        url: blob.service_url_for_direct_upload,
        headers: blob.service_headers_for_direct_upload
      })
    end

    def check_file_size!
      if blob_args[:byte_size] > 1.gigabyte
        render json: { message: 'File size must be less than 1GB.' }, status: :unprocessable_entity
      end
    end
end