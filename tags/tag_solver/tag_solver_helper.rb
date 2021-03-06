

module TagSolverHelper

    def solve_multiple_tags(tags, delimiter=nil)
        #will solve multiple tags ex: [:fist_name, :last_name]
        #and return that as full string with delimiter if specified.

        delimiter ||= ' '
        tags_sanitized = tags.map{ |tag| tag.to_s.include?('%') ? tag : "%#{tag.to_s}%" }
        tags_sanitized.map{|tag|  TagSolver.new( tag ).parse_tag  }.join( delimiter )

    end

    def solve_tag(tag, tag_args={})

        solver = TagSolver.new( tag.dup, tag_args.dup )
        solver.parse_tag

    end
end
