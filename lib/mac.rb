module Os
  def self.diskused
    df = `df -kl`
    sum = 0.00
    df.each_line.with_index do |line, line_index|
      next if line_index.eql? 0
      line = line.split(" ")
      next if line[0] =~ /localhost/
      sum += ((line[2].to_f)/1024)/1024
    end
    sum.round(2)
  end

  def self.cpuused
    top = `top -l1 | awk '/CPU usage/'`
    top = top.gsub(/[\,a-zA-Z:]/, "").split(" ")
    top[0].to_f
  end

  def self.cputop
    top %w"$11 $3"
  end

  def self.memtop
    top %w"$11 $4"
  end

  def self.memused
    top = `top -l1 | awk '/PhysMem/'`
    top = top.gsub(/[\.\,a-zA-Z:]/, "").split(" ").reverse
    ((top[1].to_f / (top[0].to_f + top[1].to_f)) * 100).round(2)
  end

  private
  def self.top(lines)
    ps = `ps aux | awk '{print #{lines.join(", ")}}' | sort -k2nr  | head -n 10`
    array = []
    ps.each_line do |line|
      line = line.chomp.split(" ")
      array << [line.first.gsub(/[\[\]]/, "").split("/").last, line.last]
    end
    array
  end

  def self.to_gb(bytes)
    (bytes/1024)/1024
  end
end
