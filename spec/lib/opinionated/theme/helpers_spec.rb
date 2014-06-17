describe Opinionated::Theme::Helpers do
  subject { described_class }

  before do
    @default_theme_name = 'default'
    Opinionated.config.theme = 'default'
  end

  after do
    # This is set to something different in certain specs
    Opinionated.config.theme = @default_theme_name
  end

  describe '.gem_name' do
    before { Opinionated.config.theme = 'something' }

    it { expect(subject.gem_name).to eq 'opinionated-theme-something' }
  end

  describe '.theme_files_path' do
    it { expect(subject.theme_files_path).to be_a(Pathname) }
    it { expect(subject.theme_files_path).to eq(subject.root_path.join('opinionated_theme/default')) }
  end

  describe '.theme_name' do
    before { Opinionated.config.theme = 'something-randome' }

    it { expect(subject.theme_name).to eq 'something-randome' }
  end

  describe '.layout_file' do
    it { expect(subject.layout_file).to eq 'opinionated/layouts/application' }
  end

  describe '.root_path' do
    it { expect(subject.root_path).to be_a(Pathname) }

    # TODO: find a way to have that working on other's machines and on Travis
    # while not stubbing Bundler here
    it { expect(subject.root_path.to_s).to include '/opinionated-theme-default' }
  end

  describe '.add_asset_path' do
    let(:theme_js_path) { subject.assets_dir.join('javascripts').to_s }
    let(:theme_css_path) { subject.assets_dir.join('stylesheets').to_s }
    let(:theme_images_path) { subject.assets_dir.join('images').to_s }

    it { expect(Rails.application.config.assets.paths).to include(theme_js_path) }
    it { expect(Rails.application.config.assets.paths).to include(theme_css_path) }
    it { expect(Rails.application.config.assets.paths).to include(theme_images_path) }
  end
end