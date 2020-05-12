class User < ApplicationRecord
    enum role: { Admin: 0, Normal: 1 }
end
